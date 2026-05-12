require("obsidian").setup({
	legacy_commands = false,
	workspaces = {
		{
			name = "Knowledge",
			path = vim.fn.expand("~/vaults/Knowledge"),
		},
	},
})
