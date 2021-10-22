{ pkgs, ... }:

with pkgs;
let
  emacsWithDeps = [
    (emacsWithPackagesFromUsePackage {
      config = ../config/emacs/init.el;
    
      package = pkgs.emacs;
      extraEmacsPackages = epkgs: [
        epkgs.exwm
        epkgs.solarized-theme
	epkgs.nix-mode
	epkgs.vterm
      ];
    })
  ];
in {
  environment.systemPackages = emacsWithDeps;
}