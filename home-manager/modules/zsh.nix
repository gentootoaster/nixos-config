{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    shellAliases = {
      fucking = "sudo";
      vim = "nvim";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ ];
      theme = "robbyrussell";
    };
  };
}
