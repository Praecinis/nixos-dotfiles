{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.sops-nix.nixosModules.sops
      ./../../modules/nixos/apps/emacs.nix
      ./../../modules/nixos/desktop/xorg.nix
    ];

  sops.defaultSopsFile = ../../secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";
  sops.age.keyFile = "/home/prcn/.config/sops/age/keys.txt";
  sops.secrets = {
    main_sshkey = {
      sopsFile = ../../secrets/secrets.yaml;
    };
  };
  
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    enableCryptodisk = true;
    device = "nodev";
  };
  
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices = {
    crypted = {
      device = "/dev/disk/by-uuid/39f83b13-2cf2-4e3d-be11-8b109206c202";
      preLVM = true;
    };
  };
  
  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };
  
  powerManagement = {
    enable = true;
    powertop.enable = true;
    cpuFreqGovernor = lib.mkDefault "ondemand";
  };
  
  hardware.bluetooth.enable = true;
 
  networking.networkmanager.enable = true;
  networking.hostName = "crystalcave";
  networking.extraHosts = ''
    127.0.0.1 crystalcave
  '';

  networking.firewall = { 
    enable = true;
  };
  
  services.thermald.enable = true;
  services.fprintd.enable = true;
  
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
#      vaapiIntel         # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
      vaapiVdpau
      libvdpau-va-gl
    ];
  };
  
  nix.settings = {
    experimental-features = [
      "nix-command" "flakes"
    ];
  };

  time.timeZone = "Europe/Zurich";
  
  fonts.packages = with pkgs; [
    source-code-pro
    font-awesome_5
    emacs-all-the-icons-fonts
    vscode-extensions.file-icons.file-icons
    material-icons
  ];
  
  environment.systemPackages = with pkgs; [
    vim 
    git wget pfetch
  ];

  sound.mediaKeys = {
    enable = true;
    volumeStep = "5%";
  };
  
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.flatpak.enable = true;
  
  users.users.prcn = {
    isNormalUser = true;
    description = "prcn";
    extraGroups = [ "wheel" "adbusers" ];
  };
  
  services.xserver.dpi = 180;
  environment.variables = {
    GDK_SCALE = "2";
    GDK_DPI_SCALE = "0.5";
    _JAVA_OPTIONS = "-Dsun.java2d.uiScale=2";
  };
  
  services.openssh = {
	  enable = true;	
	  settings.PermitRootLogin = "yes";
  };

  users.users.root.openssh.authorizedKeys.keyFiles = [
    config.sops.secrets.main_sshkey.path
  ];

  programs.kdeconnect.enable = true;
  programs.hyprland.enable = true;
  programs.adb.enable = true;
  system.stateVersion = "23.11"; # Did you read the comment?
}

