{ pkgs
, lib
, ...
}: {
	programs.kitty = {
		enable = true;
		shellIntegration.enableZshIntegration = true;
		settings = {
			background_opacity = 0.7;
		};
		theme = ''Doom One'';
	};
}
