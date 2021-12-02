{ pkgs, ... }:

with pkgs;
let
  packages = [
    python38
    curl
    wget
    git
    xclip
    firefox
    file
    mitmproxy
    tree
    binutils
    unzip
  ];
in {
  environment.systemPackages = packages;
}
