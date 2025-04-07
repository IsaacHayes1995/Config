{ config
, pkgs
, lib
, cfg
, ...
}: {
  imports = [
    <home-manager/nixos>
    <nixos-hardware/microsoft/surface/common>
    ./hardware-configuration.nix
  ];

  nix.extraOptions = ''
    experimental-features = flakes nix-command
  '';
  services.udev.packages = [ pkgs.apio-udev-rules ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  console = {
    earlySetup = true;
    font = "${pkgs.terminus_font}/share/consolefonts/ter-132n.psf.gz";
    packages = with pkgs; [ terminus_font jetbrains-mono ];
    keyMap = "us";
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  # Networking Configuration
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  programs.nix-ld.enable = true;
  # Time Zone
  time.timeZone = "Australia/Melbourne";
  # Internationalisation Settings
  i18n.defaultLocale = "en_AU.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_AU.UTF-8";
    LC_IDENTIFICATION = "en_AU.UTF-8";
    LC_MEASUREMENT = "en_AU.UTF-8";
    LC_MONETARY = "en_AU.UTF-8";
    LC_NAME = "en_AU.UTF-8";
    LC_NUMERIC = "en_AU.UTF-8";
    LC_PAPER = "en_AU.UTF-8";
    LC_TELEPHONE = "en_AU.UTF-8";
    LC_TIME = "en_AU.UTF-8";
  };

  services.blueman.enable = true;
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.acpid = {
    enable = true;
    handlers = {
      ac-power = {
        action = ''
          vals=($1)  # space separated string to array of multiple values
          case ''${vals[3]} in
              00000000)
                  notify-send "unplugged"
                  ;;
              00000001)
                  notify-send "plugged in"
                  ;;
          esac
        '';
        event = "ac_adapter/*";
      };
    };
  };

  # Keyboard Configuration
  services.xserver.xkb = {
    layout = "au";
    variant = "";
  };

  # Printing Services
  services.printing.enable = true;

  # Sound Configuration
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # User Account
  users.extraUsers.isaac = {
    isNormalUser = true;
    createHome = true;
    home = "/home/isaac";
    description = "Isaac Hayes";
    extraGroups = [ "dialout" "wheel" "audio" "video" "networkmanager" "docker" ];
    useDefaultShell = true;
  };

  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;
  # Home Manager Configuration
  home-manager.users.isaac = import /home/isaac/Config/home.nix;

  # Auto Login
  services.displayManager.autoLogin.enable = false;
  services.displayManager.autoLogin.user = "isaac";
  systemd.services."getty@tty1".enable = true;
  systemd.services."autovt@tty1".enable = true;

  # Installed Programs
  programs.firefox.enable = true;
  programs.hyprland.enable = true;
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    wget
    nano
    surface-control
    git
    onlyoffice-desktopeditors
    picom-pijulius
    dbeaver-bin
    gcc
	apio
  ];

  # System State Version
  system.stateVersion = "24.11";
  environment.variables.EDITOR = "nvim";

  environment.shellAliases = {
    nixedit = "sudo nvim /etc/nixos/configuration.nix && sudo nixos-rebuild switch";
  };

  environment.pathsToLink = [ "/libexec" ];
  services.xserver = {
    enable = true;
    autorun = false;
    desktopManager = {
      xterm.enable = false;
    };

    displayManager = {
      startx.enable = true;
    };
	desktopManager.gnome.enable = true;
  };
}
