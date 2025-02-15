{ pkgs, ... }: {
  imports = [
    ./mappings.nix
    ./lsp.nix
    ./ui.nix
    ./dap.nix
    ./greeting.nix
    ./window.nix
    ./cmp.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    # Performance
    performance = {
      byteCompileLua.enable = true;
      combinePlugins.enable = true;
    };

    globals.mapleader = " ";

    opts = {
      tabstop = 4;
      softtabstop = 4;
      shiftwidth = 4;
      showbreak = "󰘍 ";
      number = true;
      relativenumber = true;
    };

    clipboard.providers.xclip.enable = true;

    # Disables the mouse from messing with cursor
    extraConfigLua = ''
      vim.opt.mouse=""
    '';

    colorschemes.onedark = {
      enable = true;
    };

    plugins = {
      todo-comments = {
        enable = true;
        settings.keywords = {
          "HELP" = {
            icon = "󰮥 ";
            color = "warning";
            alt = [ "FUCK" "AAAA" "REEE" ];
          };
          "LABEL" = {
            icon = "󰌕 ";
            color = "info";
            alt = [ "FILL IN" ];
          };
          "DEPRICATED" = {
            icon = "󰁨 ";
            color = "warning";
            alt = [ "DEP" "UNEEDED" ];
          };
          "DEBUG" = {
            icon = " ";
            color = "#FF5747";
            alt = [ "TESTING" "REMOVELATER" "REMOVE" ];
          };
        };
        settings.highlight.multiline = false;
      };

      ts-autotag.enable = true;
      fugitive.enable = true;
      neogen.enable = true;
      vim-be-good.enable = true;
    };
    extraPlugins = [ pkgs.vimPlugins.nvzone-typr ];
  };
}
