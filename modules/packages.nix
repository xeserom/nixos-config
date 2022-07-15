{ pkgs, ... }:

with pkgs;
let
  packages = [
    patchelf
    python38
    python38Packages.ropper
    python38Packages.keystone-engine
    python38Packages.capstone
    python38Packages.unicorn
    python38Packages.pwntools
    curl
    wget
    git
    xclip
    firefox
    file
    binutils
    unzip
    gdb
    gcc
    man-pages
    nasm
    #automake
    ghidra-bin
    rofi
    alacritty
    greetd.tuigreet
    android-studio # not free
  ];
in {
  environment.systemPackages = packages;
}
