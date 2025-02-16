{ config
, pkgs
, lib
, ...
}: {
  imports = [
    ./rofi.nix
	./hyprland.nix
    ./i3.nix
    ./nixvim/main.nix
    ./kitty.nix
    ./picom.nix
    ./polybar/main.nix
    ./waybar.nix
  ];
}
