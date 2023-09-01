return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
    version = false,
    keys = {
        { "<leader>.", "<cmd>Telescope find_files<cr>", desc = "Find files (root dir)" },
        { "<leader>fb", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
        { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Grep (root dir)" },
        { "<leader>fc", "<cmd>Telescope colorscheme<cr>", desc = "Switch colorscheme" },
        { "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Edit recent files" },
    },
}
