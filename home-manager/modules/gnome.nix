{ config, pkgs, ... }:

{
dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
         color-scheme = "prefer-dark";
         font-name="Adwaita Mono 10";
       };

     "org/gnome/desktop/background" = {
        picture-uri = "https://raw.githubusercontent.com/gentootoaster/wallpapers/refs/heads/main/wallhaven-57d9y5(1).jpg";
        picture-uri-dark = "https://raw.githubusercontent.com/gentootoaster/wallpapers/refs/heads/main/wallhaven-57d9y5(1).jpg";
    };
     
     "org/gnome/desktop/interface".show-battery-percentage = true;

     "org/gnome/shell" = {
        disable-user-extensions = false; 
        enabled-extensions = with pkgs.gnomeExtensions; [
          blur-my-shell.extensionUuid
          app-icons-taskbar.extensionUuid
          clipboard-indicator.extensionUuid  
          # system-monitor.extensionUuid
          removable-drive-menu.extensionUuid
        ];
      }; 
    };
  };
}
