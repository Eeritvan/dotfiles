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
    ./swaylock
    # ./hyprland
    # ./hyprlock
    ./niri
    # ./tmux
    ./zen
    ./brave
    ./ghostty
    ./wayle
    # ./pi
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
      cudaSupport = true;
    };
  };

  home.packages = [
    pkgs.ghostty
    pkgs.wofi
    pkgs.go
    pkgs.nodejs
    pkgs.pavucontrol
    pkgs.nixd
    pkgs.nil
    pkgs.libinput
    pkgs.python3
    pkgs.discord
    pkgs.pnpm

    pkgs.better-control
    pkgs.adwaita-icon-theme

    pkgs.gcc
    pkgs.binutils
    pkgs.goose
    pkgs.air
    pkgs.sqlc
    pkgs.gnumake
    pkgs.bruno
    pkgs.android-tools
    pkgs.android-studio
    pkgs.javaPackages.compiler.openjdk17
    pkgs.awscli2
    pkgs.prismlauncher

    pkgs.awww

    # (unstable.llama-cpp.override {
    #   cudaSupport = true;
    # })

    # inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}.pi
    # inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}.paseo-desktop

    # unstable.statix

    # inputs.brave-origin.packages.${pkgs.system}.brave-origin
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
