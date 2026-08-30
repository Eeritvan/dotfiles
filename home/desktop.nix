{ pkgs, ... }: {
  imports = [
    ./git
    ./ssh
    ./zed
    ./zsh
    ./swaylock
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

    # (pkgs.llama-cpp.override {
    #   cudaSupport = true;
    # })

    # inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}.pi

    # pkgs.statix
  ];

  home = {
    username = "eeritvan";
    homeDirectory = "/home/eeritvan";
  };

  home.stateVersion = "26.05";
  programs.home-manager.enable = true;
}
