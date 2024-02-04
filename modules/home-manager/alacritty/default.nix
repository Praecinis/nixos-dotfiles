{ config, pkgs, lib,  ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        opacity = 0.7;
      };
      colors = {
        primary = {
          background = "0xffffff";
          foreground = "0x000000";
        };
      };
    };
  };
}
