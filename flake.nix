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
        nixpkgs.lib.genAttrs [ "x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin" ] (
          system: function nixpkgs.legacyPackages.${system}
        );

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
              mini-nvim

              oil-nvim

              # Utils
              fidget-nvim
              wilder-nvim
              nvim-ts-autotag
              auto-save-nvim
              toggleterm-nvim
              tokyonight-nvim
              nvim-treesitter.withAllGrammars

              # LSP
              luasnip
              nvim-cmp
              cmp-buffer
              cmp_luasnip
              cmp-nvim-lsp
              lspkind-nvim
              lsp-zero-nvim
              cmp-async-path
              nvim-lspconfig

              (pkgs.vimUtils.buildVimPlugin {
                name = "aura-theme";
                src = pkgs.fetchFromGitHub {
                  owner = "daltonmenezes";
                  repo = "aura-theme";
                  rev = "6e4f659e74577cae7cb152a96f84c23bc9213f1b";
                  hash = "sha256-e5CgxDfxW/smWksoVv7WAonOMykpHJUfeK6twLW20lI=";
                };
                postUnpack = ''
                  mkdir -p $out
                  mv $sourceRoot/packages/neovim/* $out/
                '';
              })
            ];
          };
        };
      });
    };
}
