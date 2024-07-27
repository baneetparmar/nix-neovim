{
  plugins = {
    lsp = {
      enable = true;
      servers = {
        htmx.enable = true;
        html.enable = true;
        cssls.enable = true;
        denols.enable = true;
        eslint.enable = true;
        gopls.enable = true;
        graphql.enable = true;
        nil-ls.enable = true;
        jsonls.enable = true;
        elixirls.enable = true;
        bashls.enable = true;
        yamlls.enable = true;
        lua-ls.enable = true;
        svelte.enable = true;
        ruff-lsp.enable = true;
        tsserver.enable = true;
        dockerls.enable = true;
        tailwindcss.enable = true;

      };
      keymaps.lspBuf = {
        "gd" = "definition";
        "gD" = "references";
        "gt" = "type_definition";
        "gi" = "implementation";
        "K" = "hover";
      };
    };
    rust-tools.enable = true;
  };
  diagnostics.virtual_lines.only_current_line.enable = true;
}
