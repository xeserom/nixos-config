{
  description = "xeserom config";

  outputs = { self, nixpkgs }: {
    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ /etc/nixos/configuration.nix ./modules/desktop.nix ./modules/shared.nix ];
    };

   nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ /etc/nixos/configuration.nix ./modules/laptop.nix ./modules/shared.nix ];
    };
  };
}
