{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix  ];

  nixpkgs.config.allowUnfree = true;

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

  i18n.defaultLocale = "en_US.UTF-8";
  console.useXkbConfig = true;

  hardware.cpu.intel.updateMicrocode = true;

  services.xserver = {
    enable = true;

    libinput = {
      enable = true;
      disableWhileTyping = true;
    };

    layout = "us,ru";
    xkbOptions = "grp:win_space_toggle,ctrl:swapcaps";

    videoDrivers = [ "modesetting" ];
    useGlamor = true;

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

  fonts.fonts = with pkgs; [
    roboto
    roboto-mono
  ];

  users = {
    defaultUserShell = pkgs.zsh;

    users.sivakov512 = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" "audio" ];
    };
  };

  environment.systemPackages = with pkgs; [
    python38
    alacritty
    vim_configurable
    chromium
    tdesktop
    git
  ];
 
  environment.pathsToLink = [ "/libexec" ];

  environment.variables = {
    EDITOR = "vim";
    TERMINAL = "alacritty";
  };

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

  system.stateVersion = "20.09";
}
