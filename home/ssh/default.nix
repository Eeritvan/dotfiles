{
  programs.ssh = {
    enableDefaultConfig = false;
    enable = true;
    settings = {
      "github.com" = {
        identityFile = "~/.ssh/github";
        # pkcs11Provider = "/run/current-system/sw/lib/libtpm2_pkcs11.so";
      };

      "unari" = {
        hostname = "unari.eeritvan.dev";
      };

      "server" = {
        hostname = "100.74.93.15";
        port = 2222;
        pkcs11Provider = "/run/current-system/sw/lib/libtpm2_pkcs11.so";
      };
    };
  };
}
