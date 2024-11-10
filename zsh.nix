{ config, lib, pkgs, ... }:
{
  programs = {
    zsh = {
      enable = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      ohMyZsh = {
        enable = true;
        theme = "duellj";
        plugins = [
	  "git"
          "kubectl"
          "helm"
          "docker"
        ];
      };
    };
  };

  users.defaultUserShell = pkgs.zsh;
}
