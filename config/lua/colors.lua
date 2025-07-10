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

require("aura-theme")

vim.cmd.colorscheme("aura-dark")
