local icons = require("core.icons")

local M = {}

local cached_branch = ""
local last_check = 0

local function git_branch()
	local now = vim.loop.now()
	if now - last_check > 5000 then
		cached_branch = vim.fn.system("git branch --show-current 2>/dev/null | tr -d '\n'")
		last_check = now
	end
	return cached_branch ~= "" and (" \u{e725} " .. cached_branch .. " ") or ""
end

local function file_type()
	local ft = vim.bo.filetype
	if ft == "" then
		return icons.filetypes.default
	end
	return (icons.filetypes[ft] or icons.filetypes.default) .. ft
end

local function file_size()
	local size = vim.fn.getfsize(vim.fn.expand("%"))
	if size < 0 then
		return ""
	end

	if size < 1024 then
		return " \u{f016} " .. size .. "B "
	elseif size < 1024 * 1024 then
		return string.format(" \u{f016} %.1fK ", size / 1024)
	else
		return string.format(" \u{f016} %.1fM ", size / 1024 / 1024)
	end
end

local function mode_icon()
	local mode = vim.fn.mode()
	return icons.mode[mode] or (" \u{f059} " .. mode)
end

function M.active()
	return table.concat({
		"  ",
		"%#StatusLineBold#",
		mode_icon(),
		"%#StatusLine#",
		" \u{e0b1} %f %h%m%r",
		git_branch(),
		"\u{e0b1} ",
		file_type(),
		"\u{e0b1} ",
		file_size(),
		"%=",
		" \u{f017} %l:%c  %P ",
	})
end

function M.inactive()
	return "  %f %h%m%r \u{e0b1} " .. file_type() .. " %=  %l:%c   %P "
end

local group = vim.api.nvim_create_augroup("UserStatusline", { clear = true })

vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
	group = group,
	callback = function()
		vim.opt_local.statusline = "%!v:lua.require'core.statusline'.active()"
	end,
})

vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
	group = group,
	callback = function()
		vim.opt_local.statusline = "%!v:lua.require'core.statusline'.inactive()"
	end,
})

return M
