local lspconfig = require('lspconfig')

-- This line will disable inline diagnostics
-- vim.diagnostic.config({virtual_text = false})

local handlers =  {
  ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = "rounded"}),
  ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = "rounded" }),
}

local opts = { noremap=true, silent=true }
vim.keymap.set('n', 'gl', vim.diagnostic.open_float, opts)
vim.keymap.set('n', 'gL', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
end


local lsp_flags = {
    debounce_text_changes = 150,
}

-----
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-----

-- python
lspconfig.pyright.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    handlers = handlers,
}

-- bash
lspconfig.bashls.setup{
    handlers = handlers,
    on_attach = on_attach,
    flags = lsp_flags,
}

-- lua
lspconfig.lua_ls.setup {
    handlers = handlers,
    on_attach = on_attach,
    flags = lsp_flags,
}

-- C / C++ / Obj-C
lspconfig.ccls.setup {
    handlers = handlers,
    on_attach = on_attach,
    flags = lsp_flags,
    init_options = {
        cache = {
            directory = ".ccls-cache";
        };
    }
}

-- json
lspconfig.jsonls.setup{
    handlers = handlers,
    on_attach = on_attach,
    flags = lsp_flags,
}

-- haskell
--lspconfig.hls.setup{
--    handlers = handlers,
--    on_attach = on_attach,
--    flags = lsp_flags,
--    filetypes = { 'haskell', 'lhaskell', 'cabal' },
--}

-- zig
--lspconfig.zls.setup{
--    handlers = handlers,
--    on_attach = on_attach,
--    flags = lsp_flags,
--}

-- javascript / typescript
--lspconfig.tsserver.setup {
--    handlers=handlers,
--    on_attach = on_attach,
--    flags = lsp_flags,
--}

-- rust
--lspconfig.rust_analyzer.setup {
--    handlers=handlers,
--    on_attach = on_attach,
--    flags = lsp_flags,
--    settings = {
--        ["rust-analyzer"] = {}
--    }
--}

-- java
-- to use jdtls, install it first
-- https://github.com/eclipse/eclipse.jdt.ls#installation
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jdtls
lspconfig.jdtls.setup{
    on_attach=on_attach,
    flags=lsp_flags,
    handlers=handlers,
    -- NOTE: Point `-data` to parent directory of your java projects and put /workspace in front of it.
    cmd = { '/home/hx/.local/jdt/bin/jdtls', '-data', '/home/hx/projects/java/workspace' },
    filetypes = { 'java' },
}

-- scala
-- Install `metals` language server.
-- ./coursier install metals
--require'lspconfig'.metals.setup{
--    handlers = handlers,
--    on_attach = on_attach,
--    flags = lsp_flags,
--    cmd = { "/home/hx/.local/share/coursier/bin/metals" },
--}
