{ pkgs, config, ... }: {
  imports = [
    ./git
    ./ssh
    ./zed
    ./zsh
  #  ./swaylock
    ./niri
    # ./tmux
    ./zen
    ./brave
    ./ghostty
    ./wayle
    # ./pi
  ];

  nixpkgs.config = {
    allowUnfree = true;
    cudaSupport = true;
  };

  home.packages = [
    pkgs.ghostty
    pkgs.wofi
    pkgs.nixd
    pkgs.nil

    pkgs.discord
    pkgs.bruno
    pkgs.libinput

    pkgs.awww
    pkgs.devenv

    pkgs.android-tools
    pkgs.android-studio
    pkgs.javaPackages.compiler.openjdk17

    # (pkgs.llama-cpp.override {
    #   cudaSupport = true;
    # })
    # inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}.pi
    # pkgs.statix
  ];

  # programs.ssh = {
  #   startAgent = true;
  #   agentPKCS11Whitelist = "${config.security.tpm2.pkcs11.package}/lib/*,/run/current-system/sw/lib/*";
  #   # pkcs11Provider = "/run/current-system/sw/lib/libtpm2_pkcs11.so";
  # };

  home = {
    username = "eeritvan";
    homeDirectory = "/home/eeritvan";
  };

  home.stateVersion = "26.05";
  programs.home-manager.enable = true;
}
