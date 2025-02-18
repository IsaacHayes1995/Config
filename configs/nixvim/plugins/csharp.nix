{ pkgs, ... }: {
  programs.nixvim = {
    extraPlugins = [ pkgs.vimPlugins.roslyn-nvim ];
    extraConfigLua = "require('roslyn').setup({})";

    autoCmd = [
      {
        event = "FileType";
        pattern = "cs";
        callback = {
          __raw = ''
            function()
              require('roslyn').setup({exe = 'Microsoft.CodeAnalysis.LanguageServer'});
            end
          '';
        };
      }
    ];
  };

  home.packages = with pkgs; [ roslyn-ls ];
}
