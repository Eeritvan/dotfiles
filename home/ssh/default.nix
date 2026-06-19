{
  programs.ssh = {
    enableDefaultConfig = false;
    enable = true;
    settings = {
      "github.com" = {
        identityFile = "~/.ssh/github_ed25519";
      };

      "unari" = {
        hostname = "unari.eeritvan.dev";
      };

      "server" = {
        hostname = "100.74.93.15";
        port = 2222;
        identityFile = "~/.ssh/hetzner_ed25519";
      };
    };
  };
}
