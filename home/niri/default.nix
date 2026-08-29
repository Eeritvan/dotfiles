{ pkgs, inputs, lib, ... }: {
  imports = [
    inputs.niri.homeModules.niri
  ];

  programs.niri = {
    enable = true;
    package = inputs.niri.packages.${pkgs.system}.niri-unstable;
    settings = {
      prefer-no-csd = true;
      spawn-at-startup = [
        {
          command = [ "wayle" "panel" "start" ];
        }
      ];
      outputs."DP-2" = {
        mode = {
          width = 1920;
          height = 1080;
          refresh = 143.855;
        };
        # scale 2.0
        # transform "90"
        # position x=1280 y=0
        # variable-refresh-rate // on-demand=true
        # focus-at-startup
        # backdrop-color "#001100"
        # // max-bpc 8

        # hot-corners {
        #     // off
        #     top-left
        #     // top-right
        #     // bottom-left
        #     // bottom-right
        # }

        # layout {
        #     // ...layout settings for eDP-1...
        # }

        # // Custom modes. Caution: may damage your display.
        # // mode custom=true "1920x1080@100"
        # // modeline 173.00  1920 2048 2248 2576  1080 1083 1088 1120 "-hsync" "+vsync"
      };
      window-rules = [
        {
          geometry-corner-radius = {
            top-left = 12.0;
            top-right = 12.0;
            bottom-left = 12.0;
            bottom-right = 12.0;
          };
          clip-to-geometry = true;
          # open-maximized true;
        }
      ];
      # recent-windows = {
      #   debounce-ms = 750;
      #   open-delay-ms = 150;

      #   # highlight = {
      #   #   active-color = "#999999ff";
      #   #   urgent-color = "#ff9999ff";
      #   #   padding = 30;
      #   #   corner-radius = 15;
      #   # };

      #   # previews {
      #   #     max-height 480
      #   #     max-scale 0.5
      #   # }

      #   # binds {
      #   #     Alt+Tab         { next-window; }
      #   #     Alt+Shift+Tab   { previous-window; }
      #   #     Alt+grave       { next-window     filter="app-id"; }
      #   #     Alt+Shift+grave { previous-window filter="app-id"; }

      #   #     Mod+Tab         { next-window; }
      #   #     Mod+Shift+Tab   { previous-window; }
      #   #     Mod+grave       { next-window     filter="app-id"; }
      #   #     Mod+Shift+grave { previous-window filter="app-id"; }
      #   # }
      # };
      cursor = {
        theme = "default";
        size = 25;
        hide-when-typing = true;
      };
      layout = {
        gaps = 10;
        focus-ring = {
          width = 3;
          # active-color "#7fc8ff"
          # inactive-color "#505050"
          # urgent-color "#9b0000"
          # // active-gradient from="#80c8ff" to="#bbddff" angle=45
          # // inactive-gradient from="#505050" to="#808080" angle=45 relative-to="workspace-view"
          # // urgent-gradient from="#800" to="#a33" angle=45
        };
        border = {
          width = 3;
          # "active-color" = "#ffc87f";
          # inactive-color = "#505050";
          # urgent-color = "#9b0000";
          # active-gradient from="#ffbb66" to="#ffc880" angle=45 relative-to="workspace-view"
          # inactive-gradient from="#505050" to="#808080" angle=45 relative-to="workspace-view" in="srgb-linear"
          # urgent-gradient from="#800" to="#a33" angle=45
        };
      };
      input = {
        keyboard = {
          xkb = {
            layout = "fi";
            # variant = "colemak_dh_ortho";
            # options = "compose:ralt,ctrl:nocaps";
          };
        };
        mouse = {
          # off
          # natural-scroll;
          # accel-speed 0.2
          # accel-profile "flat"
          # scroll-factor 1.0
          # scroll-factor vertical=1.0 horizontal=-2.0
          # scroll-method "no-scroll"
          # scroll-button 273
          # scroll-button-lock
          # left-handed
          # middle-emulation
        };
        touchpad = {
          # off
          tap = true;
          # dwt
          # dwtp
          # drag false
          # drag-lock
          natural-scroll = true;
          accel-speed = 0.2;
          # accel-profile "flat"
          # scroll-factor 1.0
          # scroll-factor vertical=1.0 horizontal=-2.0
          # scroll-method "two-finger"
          # scroll-button 273
          # scroll-button-lock
          # tap-button-map "left-middle-right"
          # click-method "clickfinger"
          # left-handed
          # disabled-on-external-mouse
          # middle-emulation
        };
      };
      overview = {
        zoom = 0.75;
      };
      clipboard = {
        disable-primary = true;
      };
      hotkey-overlay = {
        skip-at-startup = true;
      };
      binds = {
        "Mod+D".action.spawn = ["wofi" "--show" "drun"];
        "Mod+C".action.close-window = [];
        "Mod+X".action.spawn = "zen-browser";
        "Mod+Q".action.spawn = "ghostty";
        "Mod+P".action.screenshot.show-pointer = false;
        "Mod+F".action.maximize-column = [];
        "Mod+Shift+F".action.fullscreen-window = [];
        "Mod+Shift+E".action.quit = [];
      };
    };
  };
}
