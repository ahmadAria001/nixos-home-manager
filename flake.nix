{
  description = "Home Manager configuration of tereza";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      #inputs.nixpkgs.follows = "nixpkgs";
    };

    ags = {
      url = "github:Aylur/ags";
    };

    spicetify-nix = {
      url = "github:the-argus/spicetify-nix";
    };

    catppuccin = {
      url = "github:catppuccin/nix";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    nixvim,
    catppuccin,
    spicetify-nix,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    homeConfigurations."tereza" = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs {inherit system;};
      extraSpecialArgs = {
        inherit inputs;
        inherit nixvim;
        inherit spicetify-nix;
      };

      modules = [
        catppuccin.homeManagerModules.catppuccin
        ./home.nix
        ./spicetify.nix
        ./nixvim.nix
      ];
    };
  };
}
