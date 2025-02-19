{ config
, pkgs
, lib
, ...
}: {
  imports = [
    ./dunst.nix
	./direnv.nix
    ./rofi/rofi.nix
    ./hyprland/hyprland.nix
    ./i3/i3.nix
    ./nixvim/main.nix
    ./kitty.nix
    ./i3/picom.nix
    ./i3/polybar/main.nix
    ./hyprland/waybar/waybar.nix
  ];
}
