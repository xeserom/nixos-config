{ pkgs, ... }:

with pkgs;
let
  emacsWithDeps = [
    (emacsWithPackagesFromUsePackage {
      package = pkgs.emacs;

      # ???
      config = ../config/emacs/init.el;
      
      extraEmacsPackages = epkgs: [
        epkgs.exwm
        epkgs.solarized-theme
	      epkgs.nix-mode
	      epkgs.vterm
        epkgs.realgud
        epkgs.realgud-jdb
      ];
    })
  ];
in {
  environment.systemPackages = emacsWithDeps;
}
