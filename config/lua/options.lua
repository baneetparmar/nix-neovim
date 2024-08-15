local config = {
	opt = {
		clipboard = "unnamedplus",

		ignorecase = true,
		ttimeoutlen = 5,
		wrap = false,
		shortmess = "atI",
		hidden = true,
		swapfile = false,
		errorbells = false,
		showmode = false,
		pumheight = 8,
		completeopt = "menuone,noselect",

		cursorline = true,
		number = true,
		mouse = "a",
		smartindent = true,
		tabstop = 2,
		shiftwidth = 2,
		shiftround = true,
		expandtab = true,
		scrolloff = 10,
		undofile = true,
	},
}

for scope, table in pairs(config) do
	for option, value in pairs(table) do
		vim[scope][option] = value
	end
end
