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
    ghidra-bin
    rofi
    alacritty
    android-studio
    rtorrent
    mpv
  ];
in {
  environment.systemPackages = packages;
}
