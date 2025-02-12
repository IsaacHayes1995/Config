{ config
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
  imports = [ nixvim.homeManagerModules.nixvim ./nixvim/nixvim.nix ];
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    arandr
    kdePackages.qtsvg
    autorandr
    busybox
    atool
    nerdfonts
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
    kitty
    gimp
    python3
    rxvt-unicode
    dolphin
	polybar
  ];
  programs.thefuck.enable = true;
  programs.emacs.enable = true;

  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    initExtra = ''export JAVA_HOME=/nix/store/21j17n0bvs77s4l03xnw5mx70dranl68-openjdk-23.0.1+11/lib/openjdk'';
    shellAliases = {
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
