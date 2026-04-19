vim.pack.add({
	"https://www.github.com/nvim-tree/nvim-tree.lua",
	"https://www.github.com/ibhagwan/fzf-lua",
	"https://www.github.com/echasnovski/mini.nvim",
	"https://github.com/lewis6991/gitsigns.nvim",
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
	},
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	{
		src = "https://github.com/saghen/blink.cmp",
		version = vim.version.range("1.*"),
	},
	"https://www.github.com/creativenull/efmls-configs-nvim",
	"https://www.github.com/L3mon4D3/LuaSnip",
})

local function packadd(name)
	vim.cmd("packadd " .. name)
end

packadd("nvim-tree.lua")
packadd("fzf-lua")
packadd("mini.nvim")
packadd("gitsigns.nvim")
packadd("nvim-treesitter")
packadd("nvim-lspconfig")
packadd("mason.nvim")
packadd("efmls-configs-nvim")
packadd("blink.cmp")
packadd("LuaSnip")

require("plugins.nvim-tree")
require("plugins.fzf")
require("plugins.mini")
require("plugins.gitsigns")
require("plugins.treesitter")
require("plugins.mason")
require("plugins.blink")
require("plugins.lsp")
require("plugins.efm")
