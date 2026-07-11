local flash = require("flash")

flash.setup({})

-- flash is a plain module -> dot calls (like fzf-lua), not colons

-- Jump: normal / visual / operator-pending
vim.keymap.set({ "n", "x", "o" }, "s", function()
	flash.jump()
end, { desc = "Flash jump" })

-- Treesitter select: jump to and select treesitter nodes
vim.keymap.set({ "n", "x", "o" }, "S", function()
	flash.treesitter()
end, { desc = "Flash treesitter" })

-- Remote (operator-pending): e.g. yr<label> to yank a remote textobject
vim.keymap.set("o", "r", function()
	flash.remote()
end, { desc = "Flash remote" })

-- Treesitter search (operator / visual)
vim.keymap.set({ "o", "x" }, "R", function()
	flash.treesitter_search()
end, { desc = "Flash treesitter search" })

-- Toggle flash while in search (/ or ?)
vim.keymap.set("c", "<c-s>", function()
	flash.toggle()
end, { desc = "Toggle Flash search" })
