{
  description = "JP Nix Config";
  inputs = {
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    nixpkgs.url = "github:NixOS/nixpkgs/8809585e6937d0b07fc066792c8c9abf9c3fe5c4";
    # Unstable is currently broken.
    #nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-nil.url = "github:oxalica/nil";
    nix-nil.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

  };
  outputs = { self, nix-darwin, nixpkgs, nix-homebrew, home-manager, ... }@inputs:
    {
      darwinConfigurations."mini" =
        let
          machine = import ./machines/mini.nix;
          inherit (machine) system;

        in
        nix-darwin.lib.darwinSystem {
          inherit system;
          modules = [
            ./mac-config.nix
            nix-homebrew.darwinModules.nix-homebrew
            {
              nix-homebrew = {
                enable = true;
                enableRosetta = true;
                user = "jasonpraful";
              };
            }
          ];
          specialArgs = builtins.removeAttrs inputs [ "self" "darwin" "nixpkgs" ] // { inherit machine; };

        };
    };
}

