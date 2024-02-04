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
    };
    
    displayManager = {
      defaultSession = "Hyprland";
    };
  };
  
  services.picom.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.gnome.sushi.enable = true;
  programs.seahorse.enable = true;
}
