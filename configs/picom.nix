{ pkgs
, lib
, ...
}: {
	services.picom = {
		enable = true;
		package = pkgs.picom-pijulius;
	};
}
