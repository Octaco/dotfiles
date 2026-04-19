require("fzf-lua").setup({})

vim.keymap.set("n", "<leader>ff", function()
	require("fzf-lua").files()
end, { desc = "FZF files" })

vim.keymap.set("n", "<leader>fg", function()
	require("fzf-lua").live_grep()
end, { desc = "FZF live grep" })

vim.keymap.set("n", "<leader>fb", function()
	require("fzf-lua").buffers()
end, { desc = "FZF buffers" })

vim.keymap.set("n", "<leader>fh", function()
	require("fzf-lua").help_tags()
end, { desc = "FZF help tags" })

vim.keymap.set("n", "<leader>fx", function()
	require("fzf-lua").diagnostics_document()
end, { desc = "FZF diagnostics document" })

vim.keymap.set("n", "<leader>fX", function()
	require("fzf-lua").diagnostics_workspace()
end, { desc = "FZF diagnostics workspace" })
