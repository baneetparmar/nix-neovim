{
  plugins = {
    treesitter = {
      enable = true;
      nixGrammars = true;
      settings.indent.enable = false;
    };
    treesitter-context = {
      enable = true;
      settings = {
        max_lines = 4;
      };
    };
    rainbow-delimiters.enable = true;
  };
}
