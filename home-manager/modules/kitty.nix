{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    extraConfig = "linux_display_server x11";
    themeFile = "VSCode_Dark";
    font = {
      name = "Adwaita Mono";
      size = 15;
    };
    settings = {
      confirm_os_window_close = 0;
      enable_audio_bell = false;
      window_padding_width = 5;
    };
  };
}
