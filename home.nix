{ config, pkgs, ... }:

{
  imports = [ ./modules/home-manager ];

  home.username = "prcn";
  home.homeDirectory = "/home/prcn";
  home.stateVersion = "24.05";
  home.packages = with pkgs; [
    signal-desktop
    element-desktop
    ungoogled-chromium
    brave
    firefox
    floorp
    anki
    gdu
    wget
    lm_sensors
    acpi
    htop
    tree
    keepassxc
    bitwarden
    ventoy-full
    github-desktop
    imagemagick
    mpv
    vlc
    jellyfin-media-player
    pavucontrol
    nerd-font-patcher
    nerdfonts
    vscode-extensions.file-icons.file-icons
    nixpkgs-fmt
    hyprpaper
    brightnessctl
    swaylock
    grim
    slurp
    wl-clipboard
    obs-studio
    qview
    inkscape
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    initExtra = ''
      shostname() {
        h=$(hostname)
        f=$(echo "$h" | head -c 1)
        l=$(echo "$h" | tail -c 5)
        echo "$f$l"
      }
      export PS1="\\[\\033[38;5;54m\\]\\u@$(shostname):\\w\\$\\[\\033[0m\\] ";
    '';
  };

  services.kdeconnect.enable = true;
  programs.home-manager.enable = true;
}
