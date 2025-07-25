local opt = vim.opt

opt.backup         = false                      -- creates a backup file
opt.clipboard      = "unnamedplus"              -- allows neovim to access the system clipboard
opt.cmdheight      = 1                          -- more space in the neovim command line for displaying messages
opt.completeopt    = { "menuone", "noselect" }  -- mostly just for cmp
opt.conceallevel   = 0                          -- so that `` is visible in markdown files
opt.fileencoding   = "utf-8"                    -- the encoding written to a file
opt.hlsearch       = true                       -- highlight all matches on previous search pattern
opt.ignorecase     = true                       -- ignore case in search patterns
opt.mouse          = "a"                        -- allow the mouse to be used in neovim
opt.pumheight      = 10                         -- pop up menu height 
opt.showmode       = false                      -- we don't need to see things like -- INSERT -- anymore
opt.showtabline    = 2                          -- always show tabs
opt.smartcase      = true                       -- smart case
opt.smartindent    = true                       -- make indenting smarter again
opt.splitbelow     = true                       -- force all horizontal splits to go below current window
opt.splitright     = true                       -- force all vertical splits to go to the right of current window
opt.swapfile       = false                      -- creates a swapfile
opt.termguicolors  = true                       -- set term gui colors (most terminals support this)
opt.timeoutlen     = 1000                       -- time to wait for a mapped sequence to complete (in milliseconds)
opt.undofile       = true                       -- enable persistent undo
opt.updatetime     = 300                        -- faster completion (4000ms default)
opt.writebackup    = false                      -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
opt.expandtab      = true                       -- convert tabs to spaces
opt.shiftwidth     = 4                          -- the number of spaces inserted for each indentation
opt.tabstop        = 4                          -- insert 4 spaces for a tab
opt.cursorline     = true                       -- highlight the current line
opt.number         = true                       -- set numbered lines
opt.relativenumber = true                       -- set relative numbered lines
opt.numberwidth    = 4                          -- set number column width to 2 {default 4}
opt.signcolumn     = "yes"                      -- always show the sign column, otherwise it would shift the text each time
opt.wrap           = false                      -- display lines as one long line
opt.scrolloff      = 4                          -- is one of my fav
opt.sidescrolloff  = 8
opt.colorcolumn    = "96"
-- opt["guicursor"] = ""

-- Diagnostics signs
vim.fn.sign_define("DiagnosticSignError",
    {text = " ", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn",
    {text = " ", texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo",
    {text = " ", texthl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint",
    {text = "󰌵", texthl = "DiagnosticSignHint"})

if vim.fn.executable('rg') == 1 then
  vim.opt.grepprg = "rg --vimgrep --no-heading --smart-case"
  vim.opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"
end
