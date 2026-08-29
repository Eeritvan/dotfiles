{ self, inputs, ... }: {
  flake.nixosModules.desktopConfiguration = { pkgs, lib, config, ... }: {
    imports = [
      self.nixosModules.desktopHardware
      inputs.lanzaboote.nixosModules.lanzaboote
      inputs.home-manager.nixosModules.home-manager
    ];

    nix = {
      settings.auto-optimise-store = true;
      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 7d";
      };
      settings = {
        substituters = [
          "https://cache.nixos.org"
          "https://niri.cachix.org"
        ];
        experimental-features = [
          "nix-command"
          "flakes"
        ];
        trusted-public-keys = [
          "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
          "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
        ];
      };
    };

    home-manager = {
      useGlobalPkgs = true;
      # useUserPackages = true;

      extraSpecialArgs = {
        inherit inputs;
      };

      users.eeritvan = {
        imports = [
          ../../../home/desktop.nix
        ];
      };
    };

    security = {
      pam.services.swaylock = {};
      tpm2 = {
        enable = true;
        pkcs11.enable = true;
        tctiEnvironment.enable = true;
      };
    };

    environment.systemPackages = [
      pkgs.sbctl # for secure boot
      pkgs.xwayland-satellite # x11 apps
    ];

    networking = {
      hostName = "nixos"; # Define your hostname.

      firewall.enable = true;
      nftables.enable = true;

      networkmanager.enable = true;
    };

    boot = {
      loader.systemd-boot.enable = lib.mkForce false;
      loader.systemd-boot.editor = false;
      loader.efi.canTouchEfiVariables = true;

      lanzaboote = {
        enable = true;
        pkiBundle = "/var/lib/sbctl";
      };

      kernelPackages = pkgs.linuxPackages_latest;
    };

    time.timeZone = "Europe/Helsinki";

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

    services.xserver.videoDrivers = [ "nvidia" ];
    hardware = {
      nvidia-container-toolkit.enable = true;
      graphics.enable = true;
      nvidia = {
        # TODO: fix this once nvidia fixes their drivers
        # package = config.boot.kernelPackages.nvidiaPackages.beta;
        modesetting.enable = true;
        nvidiaSettings = true;
        open = true;
      };
    };

    services.xserver.xkb = {
      layout = "fi";
      variant = "";
    };

    # Configure console keymap
    console.keyMap = "fi";

    virtualisation = {
      docker = {
        enable = true;
        autoPrune = {
          enable = true;
          dates = "weekly";
        };
      };
    };

    services.greetd = {
      enable = true;
      settings = rec {
        initial_session = {
          command = "niri";
          # command = "start-hyprland";
          user = "eeritvan";
        };
        default_session = initial_session;
      };
    };

    systemd.user.services.niri.enableDefaultPath = false;

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users = {
      defaultUserShell = pkgs.zsh;
      users.eeritvan = {
        isNormalUser = true;
        description = "Eeritvan";
        extraGroups = [
          "networkmanager"
          "wheel"
          "docker"
          "kvm"
          "gamemode"
          "tss"
        ];
      };
    };

    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    programs = {
      zsh.enable = true;
      vim.enable = true;
      nano.enable = false;
      gamemode.enable = true;
      nix-ld.enable = true;
    };

    services = {
      libinput.enable = true;
      lact.enable = true;
      upower.enable = true;
      blueman.enable = true;
      tailscale.enable = true;
      tailscale.extraDaemonFlags = [ "--no-logs-no-support" ];
      hardware.openrgb = {
        enable = true;
        package = pkgs.openrgb-with-all-plugins;
      };
    };

    nixpkgs.config.allowUnfree = true;

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

    hardware.keyboard.zsa.enable = true;

    programs.steam = {
      enable = true;
      remotePlay.openFirewall = false;
      dedicatedServer.openFirewall = false;
      localNetworkGameTransfers.openFirewall = false;
    };

    system.stateVersion = "26.05";
  };
}
