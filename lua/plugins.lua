local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


local lazy = require("lazy")
-- local status_ok, lazy = pcall(require, "lazy")
-- if not status_ok then
--     return
-- end

lazy.setup({
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "nvim-telescope/telescope.nvim", branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    lazy = false,
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  },
  {
    "folke/which-key.nvim",
    lazy = true,
    opts = {},
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
  },
  {
    "hrsh7th/nvim-cmp",
    lazy = false,
  },
  {"hrsh7th/cmp-buffer", lazy = false},
  {"hrsh7th/cmp-path", lazy = false},
  {"hrsh7th/cmp-nvim-lsp", lazy = false},
  {
      "L3MON4D3/LuaSnip",
      -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      version = "2.*",
      lazy = false,
  },
  {"saadparwaiz1/cmp_luasnip", lazy = false},
  {"ryanoasis/vim-devicons", lazy = false},
  {"nvim-tree/nvim-web-devicons", lazy = false},
  {
      "akinsho/bufferline.nvim",
      lazy = false,
      version = "*",
      dependencies = {"nvim-tree/nvim-web-devicons"},
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "c", "vim", "json" },
          sync_install = false,
          highlight = { enable = true, additional_vim_regex_highlighting = true, disable = { "lua" }},
          indent = { enable = true, disable = { "python" } },
          rainbow = { enable = true, max_file_lines = nil },
        })
    end
  },
  {
      'windwp/nvim-autopairs',
      event = "InsertEnter",
      opts = {} -- this is equalent to setup({}) function
  },
  { "lewis6991/gitsigns.nvim", lazy = false },
})
