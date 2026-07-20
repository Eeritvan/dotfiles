{
  inputs,
  # lib,
  # config,
  pkgs,
  unstable,
  ...
}:
{
  imports = [
    ./git
    ./ssh
    ./zed
    ./zsh
    ./hyprland
    ./hyprlock
    # ./tmux
    ./zen
    ./brave
    ./ghostty
    ./wayle
  ];

  nixpkgs = {

    # You can add overlays here
    # overlays = [
    #   # Add overlays your own flake exports (from overlays and pkgs dir):
    #   inputs.self.overlays.additions
    #   inputs.self.overlays.modifications
    #   inputs.self.overlays.unstable-packages

    #   # You can also add overlays exported from other flakes:
    #   # neovim-nightly-overlay.overlays.default

    #   # Or define it inline, for example:
    #   # (final: prev: {
    #   #   hi = final.hello.overrideAttrs (oldAttrs: {
    #   #     patches = [ ./change-hello-to-hi.patch ];
    #   #   });
    #   # })
    # ];
    # Configure your nixpkgs instance
    config = {
      allowUnfree = true;
    };
  };

  home.packages = [
    # pkgs.ghostty
    pkgs.wofi
    unstable.go
    unstable.nodejs
    unstable.bun
    pkgs.pavucontrol
    pkgs.nixd
    pkgs.nil
    pkgs.libinput
    pkgs.python3

    pkgs.better-control
    pkgs.adwaita-icon-theme

    pkgs.gcc
    pkgs.binutils
    pkgs.goose
    pkgs.air
    pkgs.sqlc
    pkgs.gnumake
    pkgs.eas-cli
    pkgs.bruno
    pkgs.android-tools
    pkgs.android-studio
    pkgs.javaPackages.compiler.openjdk17

    pkgs.awscli2

    unstable.statix

    inputs.brave-origin.packages.${pkgs.system}.brave-origin
  ];

  # programs.steam = {
  #   enable = true;
  #   remotePlay.openFirewall = false;
  #   dedicatedServer.openFirewall = false;
  #   localNetworkGameTransfers.openFirewall = false;
  # };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or

  #  /etc/profiles/per-user/eeritvan/etc/profile.d/hm-session-vars.sh

  home = {
    username = "eeritvan";
    homeDirectory = "/home/eeritvan";
  };

  home.stateVersion = "26.05";
  programs.home-manager.enable = true;
}
