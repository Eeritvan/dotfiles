{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;

    policies = import ./policies.nix;

    profiles.default = {
      search = import ./search-config.nix { inherit pkgs; };
      settings = {
        "devtools.theme" = "dark";
        "devtools.toolbox.host" = "right";
        "devtools.cache.disabled" = true;

        "ui.systemUsesDarkTheme" = 1;
        "browser.theme.content-theme" = 2;
        "browser.theme.toolbar-theme" = 2;

        "mousewheel.default.delta_multiplier_y" = 50;
        "browser.translations.automaticallyPopup" = false;
      };
    };
  };
}
