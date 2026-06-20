{
  unstable,
  ...
}:
{
  programs.chromium = {
    enable = true;
    package = unstable.brave;
    extensions = [
      "fmkadmapgofadopljbjfkapdkoienihi" # react dev tools
    ];
  };
}
