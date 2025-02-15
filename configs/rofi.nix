{ config, pkgs, ... }:

let
  inherit (config.lib.formats.rasi) mkLiteral;
in {
  programs.rofi = {
    enable = true;
    theme = {
      "*" = {
        font = mkLiteral "Montserrat 12";
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@fg0";
        margin = 0;
        padding = 0;
        spacing = 0;

        bg0 = mkLiteral "#F5F5F5BF";
        bg1 = mkLiteral "#7E7E7E80";
        bg2 = mkLiteral "#0860F2E6";

        fg0 = mkLiteral "#242424";
        fg1 = mkLiteral "#FFFFFF";
        fg2 = mkLiteral "#24242480";
      };

      "window" = {
        background-color = mkLiteral "@bg0";
        location = mkLiteral "center";
        width = 640;
        border-radius = 8;
      };

      "inputbar" = {
        font = mkLiteral "Montserrat 20";
        padding = mkLiteral "12px";
        spacing = mkLiteral "12px";
        children = map mkLiteral [ "icon-search" "entry" ];
      };

      "icon-search" = {
        expand = false;
        filename = mkLiteral "search";
        size = 28;
      };

      "icon-search, entry, element-icon, element-text" = {
        vertical-align = mkLiteral "0.5";
      };

      "entry" = {
        font = mkLiteral "inherit";
        placeholder = mkLiteral "Search";
        placeholder-color = mkLiteral "@fg2";
      };

      "message" = {
        border = mkLiteral "2px 0 0";
        border-color = mkLiteral "@bg1";
        background-color = mkLiteral "@bg1";
      };

      "textbox" = {
        padding = mkLiteral "8px 24px";
      };

      "listview" = {
        lines = 10;
        columns = 1;
        fixed-height = false;
        border = mkLiteral "1px 0 0";
        border-color = mkLiteral "@bg1";
      };

      "element" = {
        padding = mkLiteral "8px 16px";
        spacing = mkLiteral "16px";
        background-color = mkLiteral "transparent";
      };

      "element normal active" = {
        text-color = mkLiteral "@bg2";
      };

      "element alternate active" = {
        text-color = mkLiteral "@bg2";
      };

      "element selected normal, element selected active" = {
        background-color = mkLiteral "@bg2";
        text-color = mkLiteral "@fg1";
      };

      "element-icon" = {
        size = mkLiteral "1em";
      };

      "element-text" = {
        text-color = mkLiteral "inherit";
      };
    };
  };
}

