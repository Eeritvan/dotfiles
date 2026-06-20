{
  pkgs,
  lib,
  unstable,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ../hosts/desktop
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = lib.mkForce false;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/var/lib/sbctl";
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  # gc and optimization
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # extra options
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  networking.hostName = "nixos"; # Define your hostname.

  networking.firewall.enable = true;
  networking.nftables.enable = true;

  services.tailscale.enable = true;
  services.tailscale.extraDaemonFlags = [ "--no-logs-no-support" ];

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Helsinki";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fi_FI.UTF-8";
    LC_IDENTIFICATION = "fi_FI.UTF-8";
    LC_MEASUREMENT = "fi_FI.UTF-8";
    LC_MONETARY = "fi_FI.UTF-8";
    LC_NAME = "fi_FI.UTF-8";
    LC_NUMERIC = "fi_FI.UTF-8";
    LC_PAPER = "fi_FI.UTF-8";
    LC_TELEPHONE = "fi_FI.UTF-8";
    LC_TIME = "fi_FI.UTF-8";
  };

  # nvidia stuff
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia-container-toolkit.enable = true;
  hardware.graphics.enable = true;
  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;
    open = true;
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "fi";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "fi";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.eeritvan = {
    isNormalUser = true;
    description = "Eetu Ritvanen";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "kvm"
      "gamemode"
    ];
  };

  # packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = [
    pkgs.ghostty
    pkgs.wofi
    unstable.brave
    unstable.zed-editor
    unstable.go
    unstable.nodejs
    unstable.bun
    pkgs.pavucontrol
    pkgs.nixd
    pkgs.nil
    pkgs.libinput
    pkgs.sbctl # for secure boot
  ];

  services.libinput.enable = true;

  programs.nix-ld.enable = true;

  fonts.packages = with pkgs; [
    font-awesome_4
  ];

  # docker stuff
  virtualisation = {
    docker = {
      enable = true;
      autoPrune = {
        enable = true;
        dates = "weekly";
      };
    };
  };

  programs.hyprland.enable = true;
  programs.waybar.enable = true;

  services.hardware.openrgb = {
    enable = true;
    package = unstable.openrgb-with-all-plugins;
  };

  # zsh as default shell
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  programs.nano.enable = false;
  programs.vim.enable = true;

  # bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    input = {
      General = {
        UserspaceHID = true;
      };
    };
    settings = {
      General = {
        # Shows battery charge of connected devices on supported
        # Bluetooth adapters. Defaults to 'false'.
        Experimental = true;
        # When enabled other devices can connect faster to us, however
        # the tradeoff is increased power consumption. Defaults to
        # 'false'.
        FastConnectable = false;
        UserspaceHID = true;
      };
      Policy = {
        # Enable all controllers when they are found. This includes
        # adapters present on start as well as adapters that are plugged
        # in later on. Defaults to 'true'.
        AutoEnable = true;
      };
    };
  };

  services.blueman.enable = true;

  hardware.keyboard.zsa.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = false;
    dedicatedServer.openFirewall = false;
    localNetworkGameTransfers.openFirewall = false;
  };

  programs.gamemode.enable = true;

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
  # ().
  system.stateVersion = "26.05"; # Did you read the comment?
}
