{ pkgs, ... }:

with pkgs;
let
  emacsWithDeps = [
    (emacsWithPackagesFromUsePackage {
      package = pkgs.emacs;

      # ???
      config = ../config/emacs/init.el;
      
      extraEmacsPackages = epkgs: [
        epkgs.solarized-theme
        epkgs.autothemer
	      epkgs.nix-mode
	      epkgs.vterm
        # epkgs.realgud
        #epkgs.realgud-jdb
        #epkgs.glsl-mode
        epkgs.multi-vterm
        epkgs.nasm-mode
        epkgs.go-mode
      ];
    })
  ];
in {
  environment.systemPackages = emacsWithDeps;
}
