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
      key = "~/.ssh/ssh.pub";
      signByDefault = true;
    };
  };
  # TODO: global ignores?
}
