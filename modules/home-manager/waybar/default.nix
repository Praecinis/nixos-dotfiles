{ config, pkgs, lib, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 39;

        modules-left = [
          "hyprland/workspaces"
        ];

        modules-center = [
          "hyprland/window"
        ];

        modules-right = [
          "tray"
          "hyprland/language"
          "idle_inhibitor"
          "network"
          "battery"
          "clock"
        ];

        "hyprland/window" = {
          max-length = 70;
        };

        "hyprland/workspaces" = {
          all-outputs = true;
          disable-scroll = true;
          #          format = "{name}: {icon}";
          active-only = false;
          format = "{icon}";
          format-icons = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "5";
            "6" = "6";
            "7" = "";
            "8" = "";
            "9" = "";
          };

          persistent-workspaces = {
            "1" = [ ];
            "2" = [ ];
            "3" = [ ];
            "4" = [ ];
            "7" = [ ];
            "8" = [ ];
            "9" = [ ];
            #            "0"= [];
          };

        };

        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            "activated" = "";
            "deactivated" = "";
          };
        };

        "network" = {
          # "interface": "wlp2*", // (Optional) To force the use of this interface
          "format-wifi" = "";
          # ({signalStrength}) {essid}
          "format-ethernet" = "{ipaddr}/{cidr} ";
          "tooltip-format" = "{ifname} via {gwaddr} ";
          "format-linked" = "{ifname} (No IP) ";
          "format-disconnected" = "Disconnected ⚠";
          "format-alt" = "{ifname} = {ipaddr}/{cidr}";
        };

        "battery" = {
          "states" = {
            # "good"= 95;
            "warning" = 30;
            "critical" = 15;
          };
          "format" = "{capacity}% {icon}";
          "format-charging" = "{capacity}% ";
          "format-plugged" = "{capacity}% ";
          "format-alt" = "{time} {icon}";
          # "format-good"= ""; // An empty format will hide the module
          # "format-full"= "";
          "format-icons" = [ "" "" "" "" "" ];
        };
      };
    };


    style = ''
      * {
        font-family: DejaVu Sans Mono, file-icons, "Font Awesome 5 Free";
        font-size: 10px;
      }

      .modules-left {
         margin-right: 5px;
         padding-right: 10px;                                
      }

      .modules-right {
         margin-left: 5px;
         padding-left: 10px;                                
      }

      #window {
        color: #2F277C;
      }

      #waybar {
        background: rgba(255,255,255,0.7);
        border-bottom: 1px solid rgba(50, 58, 164, 0.2);
      }

      #workspaces button.active {
        font-weight: bolder;
        color: #2F277C;
      }

      #workspaces button:hover {
        background: rgba(50, 58, 164, 0.2)
      }

      #workspaces button.visible {
        border-radius: 0;
        border: 0;
        background: transparent;
      }

      #workspaces button {
        border-radius: 0;
        border: 0;
        background: transparent;
      }

      #tray {
            padding-left: 8px;
            padding-right:8px;
            min-width: 40px;
            font-size: 10px;
      }

      #clock,
      #battery,
      #cpu,
      #memory,
      #disk,
      #temperature,
      #backlight,
      #network,
      #pulseaudio,
      #wireplumber,
      #custom-media,
      #tray,
      #mode,
      #idle_inhibitor,
      #scratchpad,
      #mpd {
          padding: 0 5px;
      }
    '';
  };
}
