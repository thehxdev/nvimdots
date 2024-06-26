return {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function ()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "c", "lua", "vim", "vimdoc" },
            sync_install = false,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = true,
                disable = { "query" }
            },
            indent = { enable = true, disable = { } },
            rainbow = { enable = true, max_file_lines = nil },
        })
    end
}
