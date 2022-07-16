{
  services.xserver.libinput = {
    enable = true;
    touchpad.naturalScrolling = true;
  };

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
}
