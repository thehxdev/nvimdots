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
    hijack_cursor = false,
    sync_root_with_cwd = true,
    prefer_startup_root = true,
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
        hide_root_folder = true,
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
        change_dir = {
            enable = true,
            global = true,
        },
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
        full_name = true,
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



local function open_nvim_tree(data)

  -- buffer is a [No Name]
  local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not no_name and not directory then
    return
  end

  -- change to the directory
  if directory then
    vim.cmd.cd(data.file)
  end

  -- open the tree
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

