{ config, pkgs, callPackage, ... }:
{
  services.xserver = {
    enable = true;
    libinput = {
      enable = true;
      mouse.accelProfile = "flat";
      touchpad.accelProfile = "flat";
    };

    excludePackages = with pkgs; [ xterm ];

    desktopManager = {
      xterm.enable = false;
      plasma5.enable = true;
    };

    displayManager = {
      defaultSession = "hyprland";
    };
  };

  xdg.portal = {
    enable = true;
    configPackages = [ pkgs.xdg-desktop-portal-hyprland ];
  };
}
