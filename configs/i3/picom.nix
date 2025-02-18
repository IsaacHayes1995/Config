{ pkgs, ... }: {
  services.picom = {
    enable = true;

    settings = {
      blur = {
        method = "dual_kawase";
        strenth = 10;
        background = false;
        background-frame = false;
        background-fixed = false;
      };
      blurExclude = [ "window_type = 'dock'" "window_type = 'desktop'" ];

      fade = true;
      fadeDelta = 5;

      shadow = false;
      shadowOffsets = [ (-7) (-7) ];
      shadowOpacity = "0.7";
      shadowExclude = [ "window_type *= 'normal' && ! name ~= ''" ];
      noDockShadow = true;
      noDNDShadow = true;

      activeOpacity = "1.0";
      inactiveOpacity = "0.8";
      menuOpacity = "0.8";

      backend = "glx";
      vSync = true;

      shadowRadius = 7;
      clearShadow = true;
      frameOpacity = 0.7;
      alphaStep = 0.06;
      detectClientOpacity = true;
      detectRoundedCorners = true;
      paintOnOverlay = true;
      detectTransient = true;
      markWmwinFocused = true;
      markOvrdirFocused = true;
    };
  };
}
