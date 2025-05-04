{ pkgs
, lib
, ...
}: {
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    settings = {
      background_opacity = 0.8;
	  confirm_os_window_close = 0;

      # The basic colors
      foreground = "#979eab";
      background = "#282c34";
      selection_foreground = "#282c34";
      selection_background = "#979eab";

      # Cursor colors
      cursor = "#979eab";
      cursor_text_color = "#282c34";

      # URL underline color when hovering with mouse
      url_color = "#61afef";

      # Kitty window border colors
      active_border_color = "#61afef";
      inactive_border_color = "#393e48";
      bell_border_color = "#e06c75";

      # OS Window titlebar colors
      wayland_titlebar_color = "system";
      macos_titlebar_color = "system";

      # Tab bar colors
      active_tab_foreground = "#282c34";
      active_tab_background = "#979eab";
      inactive_tab_foreground = "#abb2bf";
      inactive_tab_background = "#282c34";
      tab_bar_background = "#282c34";

      # Colors for marks (marked text in the terminal)
      mark1_foreground = "#98c379";
      mark1_background = "#282c34";
      mark2_foreground = "#e5c07b";
      mark2_background = "#282c34";
      mark3_foreground = "#61afef";
      mark3_background = "#282c34";

      # Extended colors
      color0 = "#282c34";
      color1 = "#e06c75";
      color2 = "#98c379";
      color3 = "#e5c07b";
      color4 = "#61afef";
      color5 = "#be5046";
      color6 = "#56b6c2";
      color7 = "#979eab";
      color8 = "#393e48";
      color9 = "#d19a66";
      color10 = "#56b6c2";
      color11 = "#e5c07b";
      color12 = "#61afef";
      color13 = "#be5046";
      color14 = "#56b6c2";
      color15 = "#abb2bf";
    };
  };
}
