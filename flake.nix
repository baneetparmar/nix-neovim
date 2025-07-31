{
  description = "standalone neovim config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixpkgs-unstable";
    mnw.url = "github:gerg-l/mnw";
  };

  outputs =
    inputs@{
      nixpkgs,
      ...
    }:
    let
      mkMnwConfig = pkgs: {
        neovim = pkgs.neovim-unwrapped;

        aliases = [
          "vi"
          "vim"
        ];

        luaFiles = [ ./nvim/lua/init.lua ];

        providers = {
          ruby.enable = true;
          python3.enable = true;
        };

        plugins = {
          dev.config = {
            pure = ./nvim;
            impure = "/' .. vim.uv.cwd()  .. '/nvim";
          };
          start = with pkgs.vimPlugins; [
            lazy-nvim
            lualine-nvim

            # aura-theme
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

            lz-n
            mini-nvim

            oil-nvim

            # Utils
            fidget-nvim
            wilder-nvim
            nvim-ts-autotag
            auto-save-nvim
            toggleterm-nvim
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
          ];
          opt = with pkgs.vimPlugins; [

          ];
        };

        extraLuaPackages = luaPkgs: [ luaPkgs.jsregexp ];

        extraBinPath = with pkgs; [
          git
          nil
          nixd

          stylua
          markdown-oxide

          bash-language-server

          ccls
          sqls
          next-ls
          htmx-lsp
          tailwindcss-language-server
          vscode-langservers-extracted
          sqls
          gopls
          jq-lsp
          marksman
          vim-language-server
          jdt-language-server
          yaml-language-server
          lua-language-server
          bash-language-server
          autotools-language-server

          ruff
          python313Packages.python-lsp-ruff
          python313Packages.python-lsp-server
        ];
      };

      forAllSystems =
        function:
        nixpkgs.lib.genAttrs
          [
            "x86_64-linux"
            "aarch64-linux"
            "x86_64-darwin"
            "aarch64-darwin"
          ]
          (
            system:
            function (
              import nixpkgs {
                inherit system;
                config.allowUnfree = true;
              }
            )
          );

      perSystem = forAllSystems (
        pkgs:
        let
          mnwConfigForWrap = mkMnwConfig pkgs;
          neovim = inputs.mnw.lib.wrap pkgs mnwConfigForWrap;
        in
        {
          packages.default = neovim;

          devShells.default = pkgs.mkShell {
            packages = [
              neovim
            ]
            ++ mnwConfigForWrap.extraBinPath;
          };

          apps.default = {
            type = "app";
            program = "${neovim}/bin/nvim";
          };
        }
      );

    in
    {
      packages = nixpkgs.lib.mapAttrs (_systemName: systemOutputs: systemOutputs.packages) perSystem;
      devShells = nixpkgs.lib.mapAttrs (_systemName: systemOutputs: systemOutputs.devShells) perSystem;
      apps = nixpkgs.lib.mapAttrs (_systemName: systemOutputs: systemOutputs.apps) perSystem;
    };
}
