{
  description = "xeserom config";

  outputs = { self, nixpkgs }: {
    nixosConfigurations.delete = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./configuration.nix ];
    };
  };
}
