-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- LSP
    use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-buffer' -- Autocompletion from buffers
    use 'hrsh7th/cmp-path' -- Autocompletion from path
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin
    use "williamboman/mason.nvim"
    use 'williamboman/mason-lspconfig.nvim'

    -- Purescript support for neovim
    --use 'purescript-contrib/purescript-vim'

    -- hover
    --use { "lewis6991/hover.nvim" }

    -- Icons
    use 'ryanoasis/vim-devicons'
    use 'nvim-tree/nvim-web-devicons'

    -- NvimTree
    use 'nvim-tree/nvim-tree.lua'

    -- Tree-sitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }

    -- Colors
    use 'folke/tokyonight.nvim'
    use { "catppuccin/nvim", as = "catppuccin" }

    -- Indent indicator
    --use 'Yggdroot/indentLine'
    --use "lukas-reineke/indent-blankline.nvim"

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Bufferline
    use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}

    -- Others
    use 'jiangmiao/auto-pairs'
    use 'tpope/vim-fugitive'
    use 'nvim-lua/plenary.nvim'
    use 'folke/which-key.nvim'
    use { 'lewis6991/gitsigns.nvim' }
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

end)
