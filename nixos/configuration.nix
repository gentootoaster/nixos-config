# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "boyo"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Yekaterinburg";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome = {
      enable = true;
      extraGSettingsOverridePackages = [ pkgs.mutter ];
      extraGSettingsOverrides = ''
        [org.gnome.mutter]
        experimental-features=['scale-monitor-framebuffer']
      '';
    };

  # Configure keymap in X11
  #services.xserver.xkb = {
  #  layout = "us";
  #  variant = "";
  #};

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  
  # Enable zsh
  programs.zsh.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.silly = {
    isNormalUser = true;
    description = "silly";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" "kvm" "libvirt" "input" ];
    packages = with pkgs; [
    # Here could be your advertisement!
    ];
  };
 
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Stupid silly things
    wget git telegram-desktop wl-clipboard tree neofetch
    openvpn steam firefox kitty cava spotify qemu_full
    virt-manager transmission_4-gtk hyfetch fastfetch
    discord neovim
    # I don't wanna be programmer anymore T-T
    nodejs_23 electron_35-bin python313Full gcc clang vscode
    # Gnome extensions
    gnomeExtensions.blur-my-shell
    gnomeExtensions.app-icons-taskbar
    gnomeExtensions.clipboard-indicator
    # Themes
    kitty-themes
    oh-my-zsh
    papirus-icon-theme
  ];

  # Disable some stuff that comes pre-installed with gnome
  environment.gnome.excludePackages = (with pkgs; [
    gnome-tour
    gedit # text editor
    gnome-music
    gnome-console
    snapshot # another webcam tool
    epiphany # web browser
    geary # email reader
    evince # document viewer
    gnome-characters
    totem # video player
    tali # poker game
    iagno # go game
    hitori # sudoku game
    atomix # puzzle game
  ]);
 
  # Fonts
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    nerd-fonts.symbols-only
  ];

  # Enable steam for gaming :D
  programs.steam.enable = true;
  
  # Disable nano(It is literally desinged by satan)
  programs.nano.enable = false;
  
  # Zapret, cuz fuck roskomnadzor
  services.zapret = {
    enable = true;
    udpSupport = true;
    udpPorts = [
      "50000:50099"
      "443"
    ];
    params = [
      "--dpi-desync=fake" 
      "--dpi-desync-repeats=20" 
      "--dpi-desync-fooling=datanoack"
      "--dpi-desync-fake-tls-mod=rnd,rndsni,padencap"
    ];
  };
  
  # Virtualization stuff
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
    };
  }; 
 
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment? (Yes, I did :3)
}
