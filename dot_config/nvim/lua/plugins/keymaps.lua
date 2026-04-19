vim.keymap.set("n", "<leader>bd", function()
	require("snacks").dashboard()
end, { desc = "Open dashboard" })

vim.keymap.set("n", "<leader>gg", function()
	require("snacks").lazygit()
end, { desc = "Open LazyGit" })
