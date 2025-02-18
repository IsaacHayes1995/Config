{ pkgs
, lib
, ...
}: {
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    settings = {
	  opacity = 0.8;
      # The basic colors
      foreground = "#89b4fa";
      background = "#1E1E2E";
      selection_foreground = "#1E1E2E";
      selection_background = "#89b4fa";

      # Cursor colors
      cursor = "#89b4fa";
      cursor_text_color = "#89b4fa";

      # URL underline color when hovering with mouse
      url_color = "#89b4fa";

      # Kitty window border colors
      active_border_color = "#89b4fa";
      inactive_border_color = "#89b4fa";
      bell_border_color = "#89b4fa";

      # OS Window titlebar colors
      wayland_titlebar_color = "system";
      macos_titlebar_color = "system";

      # Tab bar colors
      active_tab_foreground = "#89b4fa";
      active_tab_background = "#89b4fa";
      inactive_tab_foreground = "#89b4fa";
      inactive_tab_background = "#89b4fa";
      tab_bar_background = "#89b4fa";

      # Colors for marks (marked text in the terminal)
      mark1_foreground = "#a6e3a1";
      mark1_background = "#89b4fa";
      mark2_foreground = "#a6e3a1";
      mark2_background = "#89b4fa";
      mark3_foreground = "#a6e3a1";
      mark3_background = "#89b4fa";

    };
  };
}
