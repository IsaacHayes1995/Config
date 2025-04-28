{ confnmcliig
, pkgs
, lib
, ...
}:
let
  nixvim = import (builtins.fetchGit {
    url = "https://github.com/nix-community/nixvim";
    ref = "nixos-24.11";
  });
in
{
  imports = [ ./configs/main.nix nixvim.homeManagerModules.nixvim ];
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
	sweethome3d.application
	balena-cli
    spotify-player
    libnotify
    wl-clipboard
    cliphist
    chromium
    brightnessctl
    fzf
    zsh-autocomplete
    arandr
    nwg-displays
    swww
    cava
    xclip
    waybar
    kdePackages.qtsvg
    autorandr
    busybox
    atool
    httpie
    inotify-tools
    kotlin
    jdk23
    gradle
    oh-my-zsh
    gh
    feh
    cz-cli
    clang
    jetbrains-toolbox
    gitkraken
    nodejs
    gimp
    python3
    rxvt-unicode
    kdePackages.dolphin
    blueberry
    vlc
    pavucontrol
    upower
    wofi
	screen
  ];

  programs.thefuck.enable = true;
  programs.emacs.enable = true;
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = false;
    initExtra = ''
      source .nix-profile/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
      export JAVA_HOME=/nix/store/21j17n0bvs77s4l03xnw5mx70dranl68-openjdk-23.0.1+11/lib/openjdk
      export PATH="$PATH:/home/isaac/Config/scripts/"
    '';
    shellAliases = {
      bat = "cat /sys/class/power_supply/BAT1/capacity";
      vi = "nvim";
      switch = "sudo nixos-rebuild switch </dev/null";
      homedit = "vi /home/isaac/Config/home.nix && switch";
      m = "autorandr --change";
      drives = "cd /run/media/isaac";
      o = "xdg-open";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "thefuck" ];
      theme = "robbyrussell";
    };
  };

  programs.git = {
    enable = true;
    userEmail = "me@isaachayes.au";
  };

  programs.tmux = {
    enable = true;
    newSession = true;
    baseIndex = 1;
    plugins = with pkgs.tmuxPlugins; [ sensible onedark-theme ];
    terminal = "tmux-direct";
    extraConfig = ''set -g allow-passthrough "on"'';
  };

  home.stateVersion = "24.11";
  home.enableNixpkgsReleaseCheck = false;
}
