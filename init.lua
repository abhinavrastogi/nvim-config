-- Leaders must be defined before creating mappings.
vim.g.mapleader = " "

-- Personal options. mini.basics will not override options set manually.
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "no"
vim.o.undofile = true
vim.o.clipboard = "unnamedplus"
vim.o.cmdheight = 0

vim.o.expandtab = true
vim.o.smarttab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2

vim.opt.wrap = true
vim.opt.linebreak = true

vim.o.splitbelow = true
vim.o.splitright = true
vim.o.winborder = "rounded"

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true
vim.o.incsearch = true

-- Folding
vim.o.foldmethod = "indent"
vim.o.foldlevelstart = 99
vim.o.foldlevel = 0

-- Install and load plugins using Neovim's built-in package manager.
vim.pack.add({
  "https://github.com/nvim-mini/mini.nvim",
  "https://github.com/stevearc/oil.nvim",
  "https://github.com/nvim-treesitter/nvim-treesitter",
})

vim.cmd.colorscheme("miniwinter")

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
  view_options = {
    show_hidden = true,
  },
  keymaps = {
    ["q"] = "actions.close",
  },
})
require("mini.pick").setup()

-- Navigation
require("mini.bracketed").setup()

-- Editing improvements
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

require("nvim-treesitter.config").setup({
  ensure_installed = { "typescript", "tsx", "javascript" },
  highlight = { enable = true },
})

require("mini.files").setup()
require("mini.animate").setup()
require("mini.ai").setup()
require("mini.comment").setup()
require("mini.pairs").setup()
require("mini.surround").setup()
require("mini.diff").setup()
require('mini.tabline').setup()
require('mini.git').setup()
require('mini.extra').setup()
require('mini.visits').setup()

local map = vim.keymap.set

-- map("n", "<C-d>", "<C-d>zz")
-- map("n", "<C-u>", "<C-u>zz")

map("n", "<leader>e", "<cmd>lua MiniFiles.open()<cr>", { desc = "File explorer" })
map("n", "-", "<cmd>Oil<cr>", { desc = "Open parent directory" })
map("n", "<leader>ff", "<cmd>Pick files<cr>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Pick grep_live<cr>", { desc = "Search text" })
map("n", "<leader>fb", "<cmd>Pick buffers<cr>", { desc = "Find buffers" })
map("n", "<leader>fh", "<cmd>Pick help<cr>", { desc = "Find help" })
map("n", "<leader>fr", "<cmd>Pick resume<cr>", { desc = "Resume picker" })
map("n", "<leader>fo", "<cmd>lua MiniExtra.pickers.visit_paths()<cr>", { desc = "Find recent" })
map("n", "<leader>dt", "<cmd>lua MiniDiff.toggle_overlay()<cr>", { desc = "Toggle diff" })
