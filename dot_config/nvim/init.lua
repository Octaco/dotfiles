--vim ui2
require("vim._core.ui2").enable({})

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.options")

require("core.statusline")
require("core.terminal")

require("config.autocommands")
require("core.plugins")

require("config.keymaps")
require("plugins.keymaps")

require("config.ui")
