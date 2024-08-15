{
  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs?ref=nixpkgs-unstable";
    tolerable = {
      url = "github:wires-org/tolerable-nvim-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      forAllSystems =
        function:
        nixpkgs.lib.genAttrs [
          "x86_64-linux"
          "x86_64-darwin"
          "aarch64-linux"
          "aarch64-darwin"
        ] (system: function nixpkgs.legacyPackages.${system});
    in
    {
      packages = forAllSystems (pkgs: {
        default = inputs.tolerable.makeNeovimConfig "config" {
          inherit pkgs;
          src = pkgs.lib.fileset.toSource {
            root = ./.;
            fileset = ./config;
          };
          config = {
            plugins = with pkgs.vimPlugins; [
              lz-n
              luasnip
              nvim-cmp
              mini-nvim
              cmp-buffer
              cmp_luasnip
              fidget-nvim
              cmp-nvim-lsp
              lspkind-nvim
              lsp-zero-nvim
              cmp-async-path
              nvim-lspconfig
              nvim-ts-autotag
              toggleterm-nvim
              tokyonight-nvim
              nvim-treesitter.withAllGrammars
            ];
          };
        };
      });
    };
}
