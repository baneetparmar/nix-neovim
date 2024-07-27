{
  description = "nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixvim,
      flake-utils,
      ...
    }@inputs:
    let
      config = import ./config;
    in
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        nixvimLib = nixvim.lib.${system};
        pkgs = import inputs.nixpkgs {
          config.allowUnfree = true;
          inherit system;
        };
        nixvim' = nixvim.legacyPackages.${system};
        neovim = nixvim'.makeNixvimWithModule {
          inherit pkgs;
          module = config;
        };
      in
      {
        formatter = nixpkgs.legacyPackages.${system}.nixfmt-rfc-style;

        checks = {
          default = nixvimLib.check.mkTestDerivationFromNvim {
            inherit neovim;
            name = "nixvim configuration";
          };
        };

        packages = {
          default = neovim;
        };
      }
    );
}
