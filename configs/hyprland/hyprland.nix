{ config
, pkgs
, ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      exec-once = [ "acpid" "dunst" "swww-daemon" "swww img /home/isaac/Pictures/Wallpapers/wallpaper.jpg" ];
      monitor = [
        "desc:Sharp Corporation LQ144P1JX01 0x340012A0,2400x1600@60,714x1200,1.0"
        "desc:HP Inc. HP E243i CNK0241G1Z,1920x1200@59.95,0x0,1.0"
        "desc:HP Inc. HP E243i CNK0241G1W,1920x1200@59.95,1920x0,1.0"
      ];
      misc = {
        disable_splash_rendering = true;
        disable_hyprland_logo = true;
      };
      decoration = {
        rounding = 10;
        blur = {
          enabled = "true, blur";
          size = 1;
          passes = 5;
          vibrancy = "0.1696";
        };
      };
      # Keybindings for Hyprland matching i3 default keybinds
      bind = [
        "SUPER, T, exec, /isaac/Config/scripts/showtime"
        "SUPER, Return, exec, kitty"
        "SUPER, B, exec, firefox"
        "SUPER+Shift, Q, killactive,"
        "SUPER, J, movefocus, d"
        "SUPER, K, movefocus, u"
        "SUPER+Shift, J, movewindow, d"
        "SUPER+Shift, K, movewindow, u"
        "SUPER, H, movefocus, l"
        "SUPER, L, movefocus, r"
        "SUPER+Shift, H, movewindow, l"
        "SUPER+Shift, L, movewindow, r"
        "SUPER, F, fullscreen, 1"
        "SUPER, V, togglesplit,"
        "SUPER, Space, togglefloating,"
        "SUPER, S, togglegroup,"
        "SUPER, W, togglegroup,"
        "SUPER, E, togglesplit,"
        "SUPER, 1, workspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER, 4, workspace, 4"
        "SUPER, 5, workspace, 5"
        "SUPER, 6, workspace, 6"
        "SUPER, 7, workspace, 7"
        "SUPER, 8, workspace, 8"
        "SUPER, 9, workspace, 9"
        "SUPER+Shift, 1, movetoworkspace, 1"
        "SUPER+Shift, 2, movetoworkspace, 2"
        "SUPER+Shift, 3, movetoworkspace, 3"
        "SUPER+Shift, 4, movetoworkspace, 4"
        "SUPER+Shift, 5, movetoworkspace, 5"
        "SUPER+Shift, 6, movetoworkspace, 6"
        "SUPER+Shift, 7, movetoworkspace, 7"
        "SUPER+Shift, 8, movetoworkspace, 8"
        "SUPER+Shift, 9, movetoworkspace, 9"
        "SUPER, Tab, workspace, previous"
        "SUPER, D, exec, rofi -show drun"
        "SUPER+Shift, E, exit"
        "SUPER, R, submap, resize"
      ];
    };
  };
}
