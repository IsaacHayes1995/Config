{
  programs.rofi = {
    enable = true;
    theme = ./theme.rasi;
    extraConfig = {
      modi = "drun";
      show-icons = true;
      terminal = "kitty";
      drun-display-format = "{icon} {name}";
      location = 0;
      disable-history = false;
      hide-scrollbar = true;
    };
  };
}
