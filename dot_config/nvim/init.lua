vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.options")
require("config.ui")

require("core.statusline")
require("core.terminal")

require("plugins")

require("config.keymaps")
require("config.autocommands")
