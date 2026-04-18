return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    opts = {},
  },

  {
    "LazyVim/LazyVim",
    opts = function()
      return {
        colorscheme = vim.g.my_colorscheme,
      }
    end,
  },
}
