-- Enable relative numbers in insert mode
vim.api.nvim_create_autocmd("InsertEnter", {
	pattern = "*",
	command = "set relativenumber",
})

-- Disable relative numbers when leaving insert mode
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set norelativenumber",
})
