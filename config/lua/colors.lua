require("tokyonight").setup({
	style = "storm",
	cache = true,
	transparent = true,
	terminal_colors = true,
	styles = {
		comments = { italic = true },
		keywords = { italic = true },
		functions = { italic = true },
		variables = { italic = true },
	},
})
vim.cmd.colorscheme("tokyonight")
