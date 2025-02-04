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
    atool
    nerdfonts
    httpie
    inotify-tools
    kotlin
    jdk23
    gradle
    oh-my-zsh
    jetbrains.idea-ultimate
    gh
	cz-cli
	clang
  ];

  programs.thefuck.enable = true;
  programs.emacs.enable = true;

  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    initExtra = ''if [ "$TMUX" = "" ]; then tmux; fi'';
    shellAliases = {
      vi = "nvim";
      switch = "sudo nixos-rebuild switch </dev/null";
      homedit = "vi /home/isaac/Config/home.nix && switch";
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
