{ pkgs
, lib
, ...
}: {
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    settings = {
      background_opacity = 0.8;
    };
    theme = ''Doom One'';
  };
}
