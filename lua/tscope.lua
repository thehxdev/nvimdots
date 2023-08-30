-- Telescope keymaps
local telescope_blt = require('telescope.builtin')
vim.keymap.set('n', '<leader>.', telescope_blt.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope_blt.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope_blt.buffers, {})
vim.keymap.set('n', '<leader>fc', telescope_blt.colorscheme, {})
vim.keymap.set('n', '<leader>fo', telescope_blt.oldfiles, {})
--vim.keymap.set('n', '<leader>fh', telescope_blt.help_tags, {})
