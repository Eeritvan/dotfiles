{
  programs.git = {
    enable = true;
    lfs.enable = true;
    settings = {
      core = {
        editor = "vim";
      };
      init.defaultBranch = "main";
      gpg.format = "ssh";
      # TODO: push.autoSetupRemote = true; ??
      user = {
        name = "Eeritvan";
        email = "144259545+Eeritvan@users.noreply.github.com";
      };
    };
    signing = {
      # TODO format = "";
      # pkcs11Provider = "/run/current-system/sw/lib/libtpm2_pkcs11.so";
      key = "~/.ssh/github.pub";
      signByDefault = true;
    };
  };
  # TODO: global ignores?
}
