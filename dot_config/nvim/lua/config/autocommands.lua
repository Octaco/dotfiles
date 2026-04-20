local format = require("util.format")

local group = vim.api.nvim_create_augroup("UserConfig", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
	group = group,
	pattern = {
		"*.lua",
		"*.py",
		"*.go",
		"*.js",
		"*.jsx",
		"*.ts",
		"*.tsx",
		"*.json",
		"*.css",
		"*.scss",
		"*.html",
		"*.sh",
		"*.bash",
		"*.zsh",
		"*.c",
		"*.cpp",
		"*.h",
		"*.hpp",
	},
	callback = function(args)
		if not format.can_format(args.buf) then
			return
		end
		if not format.has_client(args.buf, "efm") then
			return
		end

		pcall(format.format_with, args.buf, "efm", 2000)
	end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
	group = group,
	desc = "Restore last cursor position",
	callback = function()
		if vim.o.diff then
			return
		end

		local last_pos = vim.api.nvim_buf_get_mark(0, '"')
		local last_line = vim.api.nvim_buf_line_count(0)
		local row = last_pos[1]

		if row < 1 or row > last_line then
			return
		end

		pcall(vim.api.nvim_win_set_cursor, 0, last_pos)
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = group,
	pattern = { "markdown", "text", "gitcommit" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		vim.opt_local.spell = true
		vim.opt_local.spelllang = { "de", "en" }
		vim.opt_local.showbreak = "↪ "
		vim.opt_local.textwidth = 100
		vim.opt_local.colorcolumn = "100"
	end,
})

-- vim.api.nvim_create_autocmd("UIEnter", {
-- 	once = true,
-- 	callback = function()
-- 		vim.schedule(function()
-- 			local buf = vim.api.nvim_get_current_buf()
-- 			if vim.bo[buf].filetype == "snacks_dashboard" then
-- 				vim.b[buf].minitrailspace_disable = true
--
-- 				if _G.MiniTrailspace and MiniTrailspace.unhighlight then
-- 					pcall(MiniTrailspace.unhighlight, buf)
-- 				end
-- 			end
-- 		end)
-- 	end,
-- })
