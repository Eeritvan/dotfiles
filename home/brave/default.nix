{
  pkgs,
  ...
}:
{
  programs.chromium = {
    enable = true;
    package = pkgs.brave;
    extensions = [
      "fmkadmapgofadopljbjfkapdkoienihi" # react dev tools
    ];
  };
}
