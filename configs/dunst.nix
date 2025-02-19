{ ... }: {
  services.dunst = {
    enable = true;
    settings = {
      global = {
        frame_color = "#abb2bf";
        separator_color = "#abb2bf";
      };

      urgency_low = {
        background = "#353b45";
        foreground = "#545862";
      };

      urgency_normal = {
        background = "#3e4451";
        foreground = "#abb2bf";
        timeout = 5;
      };

      urgency_critical = {
        background = "#e06c75";
        foreground = "#b6bdca";
      };
    };
  };
}
