-- vim.cmd.colorscheme("habamax")
vim.cmd.colorscheme("catppuccin-nvim")

local M = {}

-- ============================================================================
-- TRANSPARENCY
-- ============================================================================

local function transparent(group)
	local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
	vim.api.nvim_set_hl(0, group, {
		fg = hl.fg and string.format("#%06x", hl.fg) or nil,
		bg = "none",
	})
end

function M.set_transparent()
	local groups = {
		"Normal",
		"NormalNC",
		"EndOfBuffer",
		"NormalFloat",
		"FloatBorder",
		"SignColumn",
		-- "StatusLine",
		-- "StatusLineNC",
		"TabLine",
		"TabLineFill",
		"TabLineSel",
		"ColorColumn",
	}

	for _, group in ipairs(groups) do
		transparent(group)
	end

	vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none", fg = "#767676" })
	vim.api.nvim_set_hl(0, "StatusLineBold", { bold = true })
end

-- ============================================================================
-- YANK HIGHLIGHT
-- ============================================================================

function M.set_yank_highlight()
	vim.api.nvim_set_hl(0, "YankHighlight", {
		bg = "#e68a3f",
		fg = "#1a1a1a",
	})

	vim.api.nvim_create_autocmd("TextYankPost", {
		callback = function()
			vim.highlight.on_yank({
				higroup = "YankHighlight",
				timeout = 150,
			})
		end,
	})
end

-- ============================================================================
-- INIT
-- ============================================================================

M.set_transparent()
M.set_yank_highlight()

-- reapply after colorscheme changes
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		M.set_transparent()
		M.set_yank_highlight()
	end,
})

return M
