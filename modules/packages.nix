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
    manpages
    nasm
    automake
    ghidra-bin
    dmenu
  ];
in {
  environment.systemPackages = packages;
}
