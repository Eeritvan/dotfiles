{ unstable, ... }:

{
  programs.zed-editor = {
    enable = true;
    package = unstable.zed-editor;
    extensions = [
      "html"
      "toml"
      "dockerfile"
      "nix"
      "sql"
      "nginx"
      "graphql"
      "make"
      "git-firefly"
      "colored-zed-icons-theme"
    ];
    userSettings = {
      middle_click_paste = false;
      theme = {
        mode = "dark";
        dark = "Ayu Dark";
        light = "One Light";
      };
      vim_mode = true;
      title_bar = {
        show_sign_in = false;
      };
      tab_bar = {
        show_nav_history_buttons = false;
      };
      buffer_font_features = {
        calt = false;
      };
      telemetry = {
        diagnostics = false;
        metrics = false;
      };
      languages = {
        JavaScript = {
          format_on_save = "off";
        };
        TypeScript = {
          format_on_save = "off";
        };
        TSX = {
          format_on_save = "off";
        };
      };
    };
  };
}
