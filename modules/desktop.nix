{ config, pkgs, lib, ... }:

{
  nix = {
   package = pkgs.nixFlakes;
   extraOptions = lib.optionalString (config.nix.package == pkgs.nixFlakes)
     "experimental-features = nix-command flakes";
  };

  nixpkgs.config.allowUnfree = true; 

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
   
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  hardware = {
    opengl.enable = true;
    opengl.driSupport = true;
    bluetooth.enable = true;
    pulseaudio.enable = true;  
  };
  
  users.users.eno = {
    isNormalUser = true;
    hashedPassword = "$6$u1pVhQo0$VpEVDPpDc5ctm5U4kKo.1IaTGswB5U5Bpym6Q/0nYz2zSJ6ass1iVjgjKYSam4C6c3QFnM951qwf1u9IbYJTz/";
    extraGroups = [ "wheel" "audio" ];
  };
    
  environment.interactiveShellInit = ''
    alias hist='history | grep'
    alias r='emacsclient -n'
  '';
  
  networking = {
    hostName = "delete";
    useDHCP = true;
    firewall.allowedTCPPorts = [ 8000 ];
    wireless = {
      enable = true;
      interfaces = [ "wlp3s0" ]; # What if adapter doesn't exist?
      networks.googlehome.pskRaw = "8a62ea945411c3f0f25e5d5b86f07bf7e7a0310371279a00407d2005990c3dc1";
    };
  };

  services = {
    xserver = {
      enable = true;
      autorun = true;
      layout = "us";
      windowManager.dwm.enable = true;
      libinput = {
        enable = true;
        touchpad.naturalScrolling = true;
      };
    };
    
    emacs.enable = true;
    blueman.enable = true;
  };
    
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/emacs-overlay/archive/master.tar.gz;
    }))
   
    (self: super: {
      dwm = super.dwm.overrideAttrs (oldAttrs: rec {
	src = builtins.fetchGit https://github.com/xeserom/dwm;
      });
    })
  ];
  
  system.stateVersion = "21.11";
}
