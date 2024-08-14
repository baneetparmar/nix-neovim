require("colors")
require("options")

-- Plugins
require("plugins.mini")
require("plugins.treesitter")
require("plugins.fidget")
require("plugins.cmp")
require("plugins.lspconfig")
require("plugins.lspzero")
require("plugins.toggleterm")
require("plugins.ts-autotag")

vim.g.mapleader = " "
vim.api.nvim_set_keymap("n", "<C-e>", ":lua MiniFiles.open()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>e", ":lua MiniFiles.open()<CR>", { noremap = true, silent = true })
