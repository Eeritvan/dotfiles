{
  inputs,
  # lib,
  # config,
  pkgs,
  ...
}:
{
  imports = [
    ./git
    ./zed
    ./zsh
    ./hyprland
    ./ssh
    ./hyprlock
    ./tmux
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
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default

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
    pkgs.fastfetch
  ];

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
