{ pkgs
, lib
, ...
}: {
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;
        servers =
          let
            start-jdt-server = lib.getExe (pkgs.writeShellScriptBin "start-jdt-server" "jdtls -data ./.jdt-data");
          in
          {
            nil_ls.enable = true; # LS for Nix
            java_language_server = {
              enable = true;
              cmd = [ "${start-jdt-server}" ];
              package = pkgs.jdt-language-server;
            };
            cssls.enable = true;
            html.enable = true;
            bashls.enable = true;
            pylsp.enable = true;
            clangd.enable = true;
            tsserver.enable = true;
            eslint.enable = true;
            kotlin-language-server = {
              enable = true;
              settings = {
                kotlin = {
                  scripts = {
                    enabled = true;
                    buildScriptsEnabled = true;
                  };
                };
              };
            };
          };
      };

      nvim-jdtls = {
        enable = true;
        settings.java.gradle.enabled = true;
        data = "./.jdt-data";
      };

      noice.settings.presets."inc_rename" = true;
      inc-rename.enable = true; # Nice renaming UI
    };

    # Ability to toggle cmp
    extraConfigLua = ''
                  local format_enabled = true
                    vim.api.nvim_create_user_command("ToggleFormatNotified", function()
              if format_enabled then
             vim.cmd("FormatDisable")
                           require("notify")("Disabled formatting")
                   		format_enabled = false
                   	else
             vim.cmd("FormatEnable")
                           require("notify")("Enabled formatting")
                   		format_enabled = true
                    	end
                   end, {})

         require('tabout').setup {
        tabkey = '<Tab>', -- key to trigger tabout, set to an empty string to disable
        backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
        act_as_tab = true, -- shift content if tab out is not possible
        act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
        default_tab = '<C-t>', -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
        default_shift_tab = '<C-d>', -- reverse shift default action,
        enable_backwards = true, -- well ...
        completion = true, -- if the tabkey is used in a completion pum
        tabouts = {
          {open = "'", close = "'"},
          {open = '"', close = '"'},
          {open = '`', close = '`'},
          {open = '(', close = ')'},
          {open = '[', close = ']'},
          {open = '{', close = '}'},
          {open = '<', close = '>'}
        },
        ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
        exclude = {} -- tabout will ignore these filetypes
      }
    '';
    keymaps = [
      {
        key = "<leader>fm";
        action = "<cmd> Format <CR>";
        mode = "n";
        options = {
          silent = true;
          desc = "Format Files";
        };
      }

      {
        key = "<leader>tf";
        action = "<cmd> ToggleFormatNotified <CR>";
        mode = "n";
        options.desc = "Format Toggle";
      }

      {
        key = "<Leader>ra";
        action = "<cmd> IncRename <CR>";
        mode = "n";
        options.desc = "LSP Rename";
      }
    ];
  };
}
