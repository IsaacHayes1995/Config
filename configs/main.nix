{ config
, pkgs
, lib
, ...
}: {
  imports = [
    ./i3.nix
    ./nixvim/main.nix
    ./kitty.nix
    ./picom.nix
	./polybar/main.nix
  ];
}
