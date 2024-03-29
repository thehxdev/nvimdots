return {
    "smoka7/multicursors.nvim",
    event = "VeryLazy",
    dependencies = {
        'smoka7/hydra.nvim',
    },
    opts = {},
    cmd = { 'MCstart', 'MCvisual', 'MCclear', 'MCpattern', 'MCvisualPattern', 'MCunderCursor' },
    keys = {
        {
            mode = { 'v', 'n' },
            '<Leader>m',
            '<cmd>MCstart<cr>',
            desc = 'Create a selection for selected text or word under the cursor',
        },
    },
    setup = {
        hint_config = {
            border = 'rounded',
            position = 'bottom-right',
        },
        generate_hints = {
            normal = true,
            insert = true,
            extend = true,
            config = {
                column_count = 1,
            },
        },
    }
}
