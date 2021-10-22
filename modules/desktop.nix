{ config, pkgs, lib, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  networking.useDHCP = false;
  networking.interfaces.enp0s25.useDHCP = true;
  networking.interfaces.wlp3s0.useDHCP = true;
  
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  hardware.opengl.enable = true;
  hardware.opengl.driSupport = true;
  
  users.users.eno = {
    isNormalUser = true;
    hashedPassword = "$6$u1pVhQo0$VpEVDPpDc5ctm5U4kKo.1IaTGswB5U5Bpym6Q/0nYz2zSJ6ass1iVjgjKYSam4C6c3QFnM951qwf1u9IbYJTz/";
    extraGroups = [ "wheel" ];
  };

  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/emacs-overlay/archive/master.tar.gz;
    }))
  ];
  
  environment.systemPackages = with pkgs; [
    surf
    curl
    wget
    git
    xclip
    cmake
    gnumake
    gcc
    firefox
  ];
  
  services.emacs.enable = true; 
  
  environment.interactiveShellInit = ''
    alias hist='history | grep'
  '';
  
  networking = {
    hostName = "delete";
    firewall.allowedTCPPorts = [ 8000 ];
    wireless = {
      enable = true;
      interfaces = [ "wlp3s0" ];
      networks.googlehome.pskRaw = "8a62ea945411c3f0f25e5d5b86f07bf7e7a0310371279a00407d2005990c3dc1";
    };
  };
  
  services.xserver = {
    enable = true;
    autorun = true;
    layout = "us";
    
    windowManager.session = lib.singleton {
      name = "exwm";
      start = ''
	      ${pkgs.dbus.dbus-launch} --exit-with-session emacs -mm --fullscreen -l /etc/nixos/config/emacs/init.el
      '';
    };

    libinput = {
      enable = true;
      touchpad.naturalScrolling = true;
    };
  };

  system.stateVersion = "21.05";
}
