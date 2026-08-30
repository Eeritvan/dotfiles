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
      key = "~/.ssh/github_ed25519.pub";
      signByDefault = true;
    };
  };
  # TODO: global ignores?
}
