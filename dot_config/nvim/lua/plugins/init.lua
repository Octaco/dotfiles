return {
	-- ============================================================================
	-- FILE EXPLORER / NAVIGATION
	-- ============================================================================
	{
		src = "https://github.com/nvim-tree/nvim-tree.lua",
		config = "plugins.nvim_tree",
	},

	-- ============================================================================
	-- FUZZY FINDING / SEARCH
	-- ============================================================================
	{
		src = "https://github.com/ibhagwan/fzf-lua",
		config = "plugins.fzf",
	},

	-- ============================================================================
	-- UI / UTILITIES
	-- ============================================================================
	{
		src = "https://github.com/echasnovski/mini.nvim",
		config = "plugins.mini",
	},

	-- ============================================================================
	-- GIT INTEGRATION
	-- ============================================================================
	{
		src = "https://github.com/lewis6991/gitsigns.nvim",
		config = "plugins.gitsigns",
	},

	-- ============================================================================
	-- SYNTAX / TREESITTER
	-- ============================================================================
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		config = "plugins.treesitter",
		branch = "main",
		build = ":TSUpdate",
	},

	-- ============================================================================
	-- LSP / DEVELOPMENT
	-- ============================================================================
	{
		src = "https://github.com/creativenull/efmls-configs-nvim",
		config = "plugins.efm",
	},
	{
		src = "https://github.com/mason-org/mason.nvim",
		config = "plugins.mason",
	},
	{
		src = "https://github.com/neovim/nvim-lspconfig",
		config = "plugins.lsp",
	},
	{
		src = "https://github.com/mrcjkb/rustaceanvim",
		version = vim.version.range("^9"),
	},

	-- ============================================================================
	-- AUTOCOMPLETION / SNIPPETS
	-- ============================================================================
	{
		src = "https://github.com/L3mon4D3/LuaSnip",
	},
	{
		src = "https://github.com/saghen/blink.cmp",
		config = "plugins.blink",
		version = vim.version.range("1.*"),
	},

	-- ============================================================================
	-- VISUAL / FUN
	-- ============================================================================
	{
		src = "https://github.com/sphamba/smear-cursor.nvim",
		config = "plugins.smear_cursor",
	},
	--
	-- ============================================================================
	-- DEBUGGING
	-- ============================================================================

	{
		src = "https://github.com/mfussenegger/nvim-dap",
		config = "plugins.dap",
	},

	{
		src = "https://github.com/nvim-neotest/nvim-nio",
	},

	{
		src = "https://github.com/mfussenegger/nvim-dap-python",
	},

	{
		src = "https://github.com/thehamsta/nvim-dap-virtual-text",
	},

	{
		src = "https://github.com/rcarriga/nvim-dap-ui",
		-- config = "plugins.dap_ui",
	},

	-- ============================================================================
	-- TODO / EXPERIMENTAL
	-- ============================================================================
	-- Add new plugins here before assigning them to a proper category
	{
		src = "https://github.com/folke/snacks.nvim",
		config = "plugins.snacks",
	},
	{
		src = "https://github.com/ThePrimeagen/vim-be-good",
	},
	{
		src = "https://github.com/obsidian-nvim/obsidian.nvim",
		config = "plugins.obsidian",
		version = vim.version.range("*"), -- use latest release, remove to use lateset commit
	},
}
