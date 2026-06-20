{ pkgs, ... }: {
  force = true;
  default = "Brave";
  privateDefault = "Brave";
  engines =
    let
      nixSnowflakeIcon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
      braveIcon = "https://global.discourse-cdn.com/brave/original/3X/1/8/182067f3480d1a5e7aea5ae3131b116ca1ef7918.png";
      githubIcon = "https://brand.github.com/favicon.ico";
    in
    {
      "Brave" = {
        urls = [
          {
            template = "https://search.brave.com/search?q={searchTerms}";
            params = [
              {
                name = "query";
                value = "searchTerms";
              }
            ];
          }
        ];
        icon = braveIcon;
        definedAliases = [ "@br" ];
      };
      "GitHub" = {
        urls = [
          {
            template = "https://github.com/search?q={searchTerms}";
          }
        ];
        icon = githubIcon;
        definedAliases = [ "@gh" ];
      };
      "Nix Packages" = {
        urls = [
          {
            template = "https://search.nixos.org/packages";
            params = [
              {
                name = "type";
                value = "packages";
              }
              {
                name = "channel";
                value = "unstable";
              }
              {
                name = "query";
                value = "{searchTerms}";
              }
            ];
          }
        ];
        icon = nixSnowflakeIcon;
        definedAliases = [ "pkgs" ];
      };
    };
}
