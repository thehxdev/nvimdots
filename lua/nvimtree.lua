local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
    return
end

local tree_cb = nvim_tree_config.nvim_tree_callback


nvim_tree.setup {
    disable_netrw = true,
    hijack_netrw = true,
    -- open_on_setup = false,
    ignore_ft_on_setup = {
        "startify",
        "dashboard",
        "alpha",
    },
    -- open_on_tab = false,
    hijack_cursor = false,
    update_cwd = true,

    hijack_directories = {
        enable = true,
        auto_open = true,
    },

    diagnostics = {
        enable = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },

    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
    },

    git = {
        enable = true,
        ignore = true,
        timeout = 500,
    },

    view = {
        float = {
            open_win_config = {
                width = 30,
                height = 30,
            }
        },
        --width = 30,
        --height = 30,
        hide_root_folder = false,
        side = "left",
        mappings = {
            custom_only = false,
            list = {
                { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
                { key = "h", cb = tree_cb "close_node" },
                { key = "v", cb = tree_cb "vsplit" },
            },
        },
        number = false,
        relativenumber = false,
    },

    actions = {
        open_file = {
            quit_on_open = false,
            resize_window = true,
            window_picker = {
                enable = false,
            },
        },
    },
    renderer = {
        highlight_git = true,
        root_folder_modifier = ":t",
        indent_markers = {
            enable = true
        },
        icons = {
            show = {
                git = true,
                folder = true,
                file = true,
                folder_arrow = true,
            }
        },
    },
}
