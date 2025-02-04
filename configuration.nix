{ config, pkgs, ... }:
let
  # Define the custom Gnome extensions with required workarounds
  customGnomeExtensions = pkgs.gnomeExtensions // {
    pop-shell = pkgs.gnomeExtensions.pop-shell.overrideAttrs (p: {
      postInstall = p.postInstall or "" + ''
        # Workaround for NixOS/nixpkgs#92265
        mkdir --parents "$out/share/gsettings-schemas/$name/glib-2.0"
        ln --symbolic "$out/share/gnome-shell/extensions/pop-shell@system76.com/schemas" "$out/share/gsettings-schemas/$name/glib-2.0/schemas"

        # Workaround for NixOS/nixpkgs#314969
        mkdir --parents "$out/share/gnome-control-center"
        ln --symbolic "$src/keybindings" "$out/share/gnome-control-center/keybindings"
      '';
    });
  };
in
{
  imports = [
    <home-manager/nixos>
    <nixos-hardware/microsoft/surface/common>
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking Configuration
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

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

  # X11 and Desktop Environment
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Apply the session path workaround
  services.xserver.desktopManager.gnome.sessionPath = [ customGnomeExtensions.pop-shell ];

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
    extraGroups = [ "wheel" "audio" "video" "networkmanager" "docker" ];
    useDefaultShell = true;
  };

  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;
  # Home Manager Configuration
  home-manager.users.isaac = import /home/isaac/Config/home.nix;

  # Auto Login
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "isaac";
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # Installed Programs
  programs.firefox.enable = true;
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    wget
    nano 
    surface-control
    git
    onlyoffice-desktopeditors
    i3
    gnome-browser-connector
    pop-launcher
    customGnomeExtensions.pop-shell  
    dbeaver-bin
    gcc
  ];

  # System State Version
  system.stateVersion = "24.11";
  environment.variables.EDITOR = "nvim";

  environment.shellAliases = {
    nixedit = "sudo nvim /etc/nixos/configuration.nix && sudo nixos-rebuild switch";
  };
}

