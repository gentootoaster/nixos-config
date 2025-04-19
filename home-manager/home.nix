{ config, pkgs, ... }:

{
  imports = [
    ./modules/default.nix    
  ];

  home.username = "silly";
  home.homeDirectory = "/home/silly";
  home.stateVersion = "24.11";
  home.sessionVariables = {
   EDITOR = "nvim";
  };
  programs.home-manager.enable = true;
}
