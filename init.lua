-- Leaders must be defined before creating mappings.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Personal options. mini.basics will not override options set manually.
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "no"
vim.o.undofile = true
vim.o.cmdheight = 0

vim.o.expandtab = true
vim.o.smarttab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2

vim.o.splitbelow = true
vim.o.splitright = true
vim.o.winborder = "rounded"

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true
vim.o.incsearch = true

-- Install and load plugins using Neovim's built-in package manager.
vim.pack.add({
  {
    src = "https://github.com/nvim-mini/mini.nvim",
    version = "stable",
  },
  "https://github.com/stevearc/oil.nvim",
})

-- UI
require("mini.statusline").setup({
  use_icons = false,
})

MiniStatusline.section_location = function()
  return "%l/%L"
end

-- File explorer and fuzzy finding
require("oil").setup({
  columns = {},
})
require("mini.pick").setup()

-- Navigation
require("mini.bracketed").setup()

-- Editing improvements
require("mini.ai").setup()
require("mini.comment").setup()
require("mini.pairs").setup()
require("mini.surround").setup()

local map = vim.keymap.set

map("n", "-", "<cmd>Oil<cr>", { desc = "Open parent directory" })
map("n", "<leader>ff", "<cmd>Pick files<cr>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Pick grep_live<cr>", { desc = "Search text" })
map("n", "<leader>fb", "<cmd>Pick buffers<cr>", { desc = "Find buffers" })
map("n", "<leader>fh", "<cmd>Pick help<cr>", { desc = "Find help" })
map("n", "<leader>fr", "<cmd>Pick resume<cr>", { desc = "Resume picker" })
