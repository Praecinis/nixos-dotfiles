{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    extraConfig = ''
      bind=$mod, print, exec, grim -g "$(slurp -d)" | wl-copy
    '';
    settings = {
      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        layout = "dwindle";
      };

      decoration = {
        blur = {
          enabled = true;
        };
        rounding = "2";
        active_opacity = 0.99;
        inactive_opacity = 0.7;
        shadow_offset = "5 3";
        "col.shadow" = "rgba(00000099)";
      };

      animations = {
        enabled = "yes";
      };

      misc = {
        disable_hyprland_logo = true;
      };

      input = {
        kb_layout = "us,ch";
        kb_variant = ", fr";
        kb_model = "";
        kb_options = "grp:alt_shift_toggle";
        # caps:escape";
        kb_rules = "";
        follow_mouse = 1;

        touchpad = {
          natural_scroll = false;
        };

        force_no_accel = true;
        sensitivity = 0.0; # -1.0 - 1.0, 0 means no modification.
      };

      "$mod" = "SUPER";

      # Mouse bindings
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod SHIFT, mouse:272, resizewindow"
      ];

      # Keyboard bindings
      bind = [
        # Actions
        "$mod, F, fullscreen"
        "$mod SHIFT, F, fullscreen,0"
        "$mod, C, killactive"
        "$mod, M, exit"
        "$mod, A, togglefloating"

        # Software runs
        "$mod, Q, exec, alacritty"
        "$mod, W, exec, emacseditor"
        "$mod, E, exec, floorp"
        "$mod, D, exec, pkill wofi || wofi --show drun"
        "$mod, L, exec, swaylock -k"

        # Levels of lightning/audio volume
        ", xf86MonBrightnessUp, exec, brightnessctl -d intel_backlight set +10%"
        ", xf86MonBrightnessDown, exec, brightnessctl -d intel_backlight set 10%-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"

        # Workspaces
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        # Move window to workspace
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"
      ];

      windowrulev2 = [
        "opacity 0.95 0.9,class:^(.*Emacs.*)$$"
        "workspace 2, class:^(Emacs)$$"
        "workspace 3, class:^(floorp)$$"
        "workspace 9, class:^(.*Signal.*)$$"
        "workspace 1, class:^(Alacritty)$"
      ];

      exec-once = [
        "hyprpaper"
        "waybar"
        "emacseditor"
        "floorp"
      ];
    };
  };

  xdg.configFile."hypr/hyprpaper.conf".text = ''
    ipc=off
    preload=/home/zed/Downloads/riven-sb.jpg
    wallpaper=eDP-1,/home/zed/Downloads/riven-sb.jpg
  '';
}
