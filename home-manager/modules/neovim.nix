{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      vscode-nvim
      lualine-nvim
    ];
    extraConfig = ''
      set clipboard+=unnamedplus
      set number
      colorscheme vscode
    '';
    extraLuaConfig = ''
      require('lualine').setup({
        options = {
          theme = 'auto',
          icons_enabled = false
        }
      })
    '';
  };
}
