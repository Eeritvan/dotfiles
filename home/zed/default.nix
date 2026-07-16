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
      "oxc"
      "git-firefly"
      "colored-zed-icons-theme"
    ];
    userSettings = {
      middle_click_paste = false;
      redact_private_values = true;
      wrap_guides = [
        80
        120
      ];
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
      collaboration_panel = {
        button = false;
      };
      buffer_font_features = {
        calt = false;
      };
      telemetry = {
        diagnostics = false;
        metrics = false;
      };
      agent = {
        sidebar_side = "right";
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
