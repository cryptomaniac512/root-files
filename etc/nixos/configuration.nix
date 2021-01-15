{ lib, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix  ];

  hardware.cpu.intel.updateMicrocode = true;
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = "sl0";
    networkmanager.enable = true;

    useDHCP = false;
    interfaces.enp0s31f6.useDHCP = true;
    interfaces.wlp2s0.useDHCP = true;
  };

  time.timeZone = "Europe/Moscow";

  console.useXkbConfig = true;
  services.xserver = {
    enable = true;

    libinput = {
      enable = true;
      disableWhileTyping = true;
    };

    videoDrivers = [ "modesetting" ];
    useGlamor = true;

    layout = "us,ru";
    xkbOptions = "grp:win_space_toggle,ctrl:swapcaps";

    desktopManager.xterm.enable = false;

    displayManager = {
      defaultSession = "none+i3";

      lightdm = {
        enable = true;
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
        dmenu
        i3status
        i3blocks
      ];
    };
  };
  fonts.fonts = with pkgs; [ roboto roboto-mono ];

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    alacritty
    vim_configurable

    chromium
    tdesktop

    python38

    git
    gcc
    binutils
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

  services.gnome3.gnome-keyring.enable = true;
 
  environment.pathsToLink = [ "/libexec" ];
  environment.variables = {
    EDITOR = "vim";
    TERMINAL = "alacritty";

    LD_LIBRARY_PATH = with pkgs; lib.makeLibraryPath [ openssl zlib ];
    # Python uses commands like "gcc -Wl,-t -lcrypto" (followed by objdump) to discover libraries.
    # gcc uses this var to extend its library search paths
    NIX_LDFLAGS_x86_64_unknown_linux_gnu = [ "-L${pkgs.openssl.out}/lib" ];
  };
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
      extraGroups = [ "wheel" "networkmanager" "audio" ];
    };
  };

  system.stateVersion = "20.09";
}
