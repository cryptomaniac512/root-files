{ lib, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    tmpOnTmpfs = true;
  };

  hardware = {
    cpu.intel.updateMicrocode = true;
    pulseaudio = {
      enable = true;
      extraModules = [ pkgs.pulseaudio-modules-bt ];
      package = pkgs.pulseaudioFull;
    };
    bluetooth.enable = true;
  };

  networking = {
    hostName = "sl0";
    networkmanager.enable = true;

    useDHCP = false;
    interfaces.enp0s31f6.useDHCP = true;
    interfaces.wlp2s0.useDHCP = true;
  };

  time.timeZone = "Europe/Moscow";
  location = {
    provider = "manual";
    latitude = 55.77;
    longitude = 37.68;
  };

  console.useXkbConfig = true;
  services.xserver = {
    enable = true;

    libinput = {
      enable = true;
      disableWhileTyping = true;
      tapping = false;
    };

    videoDrivers = [ "modesetting" ];
    useGlamor = true;

    layout = "us,ru";
    xkbOptions = "grp:win_space_toggle,ctrl:swapcaps";

    desktopManager.xterm.enable = false;

    displayManager = {
      defaultSession = "none+i3";
      sessionCommands = ''
        test -r $HOME/.Xresources && ${pkgs.xorg.xrdb}/bin/xrdb -merge $HOME/.Xresources
        ## ${pkgs.xss-lock}/bin/xss-lock -- ${pkgs.lightdm}/bin/dm-tool lock &
      '';

      lightdm = {
        enable = true;
        background = "/etc/nixos/background-image";
        greeters.gtk = {
          indicators = [ "~spacer" "~spacer" "~clock" "~power" ];
          iconTheme = {
            package = pkgs.papirus-icon-theme;
            name = "Papirus-Dark";
          };
          theme = {
            package = pkgs.nordic-polar;
            name = "Nordic-Polar";
          };
        };
      };
    };

    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      extraPackages = with pkgs; [
        rofi
        polybarFull
      ];
    };
  };
  fonts.fonts = with pkgs; [ roboto roboto-mono font-awesome_4 ];

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    alacritty
    brightnessctl
    dnsutils
    fzf
    psmisc
    ripgrep
    vim_configurable
    xfce.thunar
    xfce.xfconf  # needed to save settings
    xfce.tumbler  # thumbnails
    xfce.exo  # 'open terminal here'

    chromium
    firefox
    flameshot
    pavucontrol
    scrot
    slack
    tdesktop
    zoom-us

    cargo
    clippy
    rust-analyzer
    rustc
    rustfmt

    python38
    python38Packages.ipython
    python38Packages.python-language-server
    python38Packages.virtualenv

    binutils
    direnv
    docker-compose
    gcc
    git
    protobuf
  ];
  programs = {
    seahorse.enable = true;
    nm-applet.enable = true;
    dconf.enable = true;
    gnupg = {
      agent.enable = true;
      agent.enableSSHSupport = true;
    };
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      shellInit = ''
        export PATH="$HOME/.local/bin:$PATH"
      '';
      setOptions = [
        "HIST_IGNORE_ALL_DUPS"
        "SHARE_HISTORY"
        "HIST_FCNTL_LOCK"
      ];
      shellAliases = {
        root-files = "git --git-dir=$HOME/.root-files.git/ --work-tree=/";
      };
      ohMyZsh = {
        enable = true;
        theme = "terminalparty";
      };
    };
  };

  virtualisation.docker.enable = true;
  services = {
    gvfs.enable = true;
    gnome3.gnome-keyring.enable = true;
    blueman.enable = true;
    dbus.packages = [ pkgs.dunst ];
    redshift = {
      enable = true;
      temperature = {
        day = 5500;
        night = 3500;
      };
    };
    actkbd = {
      enable = true;
      bindings = [
        { keys = [ 224 ]; events = [ "key" ]; command = "${pkgs.brightnessctl}/bin/brightnessctl set 5%-"; }
        { keys = [ 225 ]; events = [ "key" ]; command = "${pkgs.brightnessctl}/bin/brightnessctl set +5%"; }
      ];
    };
    lorri.enable = true;
  };

  systemd = {
    user.services.dunst.serviceConfig.ExecStart = [ "" "${pkgs.dunst}/bin/dunst" ];
    packages = [ pkgs.dunst ];
  };
 
  environment.pathsToLink = [ "/libexec" ];
  environment.variables = {
    EDITOR = "vim";
    TERMINAL = "alacritty";

    LD_LIBRARY_PATH = with pkgs; lib.makeLibraryPath [ stdenv.cc.cc.lib openssl zlib ];
    # Python uses commands like "gcc -Wl,-t -lcrypto" (followed by objdump) to discover libraries.
    # gcc uses this var to extend its library search paths
    NIX_LDFLAGS_x86_64_unknown_linux_gnu = [ "-L${pkgs.openssl.out}/lib" ];
  };
  environment.interactiveShellInit = ''
    test -r $HOME/.dir_colors &&  eval `${pkgs.coreutils}/bin/dircolors $HOME/.dir_colors`
  '';
  system.activationScripts.ld-linux =  ''
    mkdir -p /lib64

    # Let non-NixOS binaries run without patchelf --set-interpreter
    ln -sf ${pkgs.glibc}/lib/ld-linux-x86-64.so.2 /lib64

    # Provide #!/usr/bin/perl
    ln -sf ${pkgs.perl}/bin/perl /usr/bin
  '';

  users = {
    defaultUserShell = pkgs.zsh;
    users.sivakov512 = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" "audio" "docker" "video" ];
    };
  };

  system.stateVersion = "20.09";
}
