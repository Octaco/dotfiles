# Neovim Configuration

This Neovim setup is organized into small Lua modules so it is easier to understand, extend, and maintain.

## Layout

```text
lua/
├── config/   # editor behavior, options, keymaps, autocmds, UI
├── core/     # reusable internal modules
├── plugins/  # plugin installation and plugin-specific setup
└── util/     # small helpers
```

## What each part does

### `config`

- `options.lua`  
  Core Neovim options such as line numbers, indentation, searching, clipboard, folding, split behavior, and completion UI.

- `ui.lua`  
  Colorscheme and transparent highlight settings.

- `keymaps.lua`  
  Global keymaps that are not tied to one specific plugin.

- `autocommands.lua`  
  Formatting on save, yank highlighting, restoring cursor position, and Markdown/text buffer settings.

### `core`

- `icons.lua`  
  Central place for Nerd Font icons used by statusline and filetype labels.

- `statusline.lua`  
  Custom dynamic statusline for active and inactive windows.

- `terminal.lua`  
  Floating terminal logic and state handling.

### `plugins`

- `init.lua`  
  Installs plugins with `vim.pack` and loads the plugin configuration files.

- individual files  
  One file per plugin or plugin group.

### `util`

- `format.lua`  
  Helpers for checking whether a buffer can be formatted and formatting through a specific LSP client.

## Features

- transparent UI
- custom statusline
- floating terminal
- Treesitter syntax support and folds
- LSP support
- efm-based formatting and linting
- fzf-lua file/search picker
- gitsigns Git integration
- mini.nvim helpers

## Hotkeys

## General

| Key | Mode | Action |
|---|---|---|
| `<leader>c` | n | Clear search highlights |
| `n` | n | Next search result, centered |
| `N` | n | Previous search result, centered |
| `<C-d>` | n | Half-page down, centered |
| `<C-u>` | n | Half-page up, centered |
| `j` | n | Down, wrap-aware |
| `k` | n | Up, wrap-aware |
| `J` | n | Join lines and keep cursor position |
| `<leader>pa` | n | Copy full file path |
| `<leader>td` | n | Toggle diagnostics |

## Editing

| Key | Mode | Action |
|---|---|---|
| `<leader>p` | x | Paste without yanking replaced text |
| `<leader>x` | n,v | Delete without yanking |
| `<` | v | Indent left and reselect |
| `>` | v | Indent right and reselect |
| `<A-j>` | n | Move line down |
| `<A-k>` | n | Move line up |
| `<A-j>` | v | Move selection down |
| `<A-k>` | v | Move selection up |

## Buffers and windows

| Key | Mode | Action |
|---|---|---|
| `<leader>bn` | n | Next buffer |
| `<leader>bp` | n | Previous buffer |
| `<C-h>` | n | Move to left window |
| `<C-j>` | n | Move to lower window |
| `<C-k>` | n | Move to upper window |
| `<C-l>` | n | Move to right window |
| `<leader>sv` | n | Vertical split |
| `<leader>sh` | n | Horizontal split |
| `<C-Up>` | n | Increase window height |
| `<C-Down>` | n | Decrease window height |
| `<C-Left>` | n | Decrease window width |
| `<C-Right>` | n | Increase window width |

## File tree

| Key | Mode | Action |
|---|---|---|
| `<leader>e` | n | Toggle NvimTree |

## Finder (`fzf-lua`)

| Key | Mode | Action |
|---|---|---|
| `<leader>ff` | n | Find files |
| `<leader>fg` | n | Live grep |
| `<leader>fb` | n | Buffers |
| `<leader>fh` | n | Help tags |
| `<leader>fx` | n | Document diagnostics |
| `<leader>fX` | n | Workspace diagnostics |

## Git (`gitsigns`)

| Key | Mode | Action |
|---|---|---|
| `]h` | n | Next hunk |
| `[h` | n | Previous hunk |
| `<leader>hs` | n | Stage hunk |
| `<leader>hr` | n | Reset hunk |
| `<leader>hp` | n | Preview hunk |
| `<leader>hb` | n | Blame line |
| `<leader>hB` | n | Toggle inline blame |
| `<leader>hd` | n | Diff this |

## LSP

| Key | Mode | Action |
|---|---|---|
| `K` | n | Hover |
| `<leader>gd` | n | Definitions via fzf |
| `<leader>gD` | n | Go to definition |
| `<leader>gS` | n | Open definition in vertical split |
| `<leader>ca` | n | Code action |
| `<leader>rn` | n | Rename symbol |
| `<leader>d` | n | Cursor diagnostics |
| `<leader>D` | n | Line diagnostics |
| `<leader>nd` | n | Next diagnostic |
| `<leader>pd` | n | Previous diagnostic |
| `<leader>q` | n | Open diagnostic location list |
| `<leader>dl` | n | Show line diagnostics |
| `<leader>fr` | n | References |
| `<leader>ft` | n | Type definitions |
| `<leader>fs` | n | Document symbols |
| `<leader>fw` | n | Workspace symbols |
| `<leader>fi` | n | Implementations |
| `<leader>oi` | n | Organize imports and format |

## Completion (`blink.cmp`)

| Key | Mode | Action |
|---|---|---|
| `<C-Space>` | i | Show/hide completion |
| `<CR>` | i | Accept completion |
| `<C-j>` | i | Select next item |
| `<C-k>` | i | Select previous item |
| `<Tab>` | i,s | Jump snippet forward |
| `<S-Tab>` | i,s | Jump snippet backward |

## Terminal

| Key | Mode | Action |
|---|---|---|
| `<leader>t` | n | Toggle floating terminal |
| `<Esc>` | t | Close floating terminal |

## Notes

- All Lua modules live under `lua/`.
- A module like `require("config.options")` maps to:
  `~/.config/nvim/lua/config/options.lua`
- Plugin-specific keymaps are defined in the corresponding plugin file.
- Global keymaps are defined in `config/keymaps.lua`.
