local lspconfig = require('lspconfig')
local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.diagnostic.config{
  float={border="rounded"},
  virtual_text=false -- This line will disable inline diagnostics
}

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
    vim.keymap.set("n", "K", require("hover").hover, {desc = "hover.nvim"})
    vim.keymap.set("n", "gK", require("hover").hover_select, {desc = "hover.nvim (select)"})
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
end


local lsp_flags = {
    debounce_text_changes = 150,
}

-----
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-----

-- pyright
--lspconfig.pyright.setup {
--    handlers = handlers,
--    on_attach = on_attach,
--    flags = lsp_flags,
--    capabilities = capabilities,
--}

-- pylsp
lspconfig.pylsp.setup{
    cmd = { "/home/hx/.local/bin/pylsp" },
    handlers = handlers,
    on_attach = on_attach,
    flags = lsp_flags,
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    enabled = false
                }
            }
        }
    },
    capabilities = capabilities,
}

-- ruff (python linter)
lspconfig.ruff_lsp.setup{
    cmd = { "/home/hx/.local/bin/ruff-lsp" },
    handlers = handlers,
    on_attach = on_attach,
    flags = lsp_flags,
    init_options = {
        settings = {
            -- Any extra CLI arguments for `ruff` go here.
            args = {},
        }
    },
    capabilities = capabilities,
}

-- bash
lspconfig.bashls.setup{
    handlers = handlers,
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
}

-- lua
lspconfig.lua_ls.setup {
    handlers = handlers,
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
}

-- C / C++ / Obj-C
--lspconfig.ccls.setup {
--    handlers = handlers,
--    on_attach = on_attach,
--    flags = lsp_flags,
--    init_options = {
--        cache = {
--            directory = ".ccls-cache";
--        };
--    },
--    capabilities = capabilities,
--}

-- json
lspconfig.jsonls.setup{
    handlers = handlers,
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
}

-- haskell
--lspconfig.hls.setup{
--    handlers = handlers,
--    on_attach = on_attach,
--    flags = lsp_flags,
--    filetypes = { 'haskell', 'lhaskell', 'cabal' },
--    capabilities = capabilities,
--}


-- rust
--lspconfig.rust_analyzer.setup {
--    cmd = {
--        "rustup", "run", "stable", "rust-analyzer"
--    },
--    handlers=handlers,
--    on_attach = on_attach,
--    flags = lsp_flags,
--    capabilities = capabilities,
--}

-- zig
--lspconfig.zls.setup{
--    handlers = handlers,
--    on_attach = on_attach,
--    flags = lsp_flags,
--    capabilities = capabilities,
--}

-- javascript / typescript
--lspconfig.tsserver.setup {
--    handlers=handlers,
--    on_attach = on_attach,
--    flags = lsp_flags,
--    capabilities = capabilities,
--}

-- java
-- to use jdtls, install it first
-- https://github.com/eclipse/eclipse.jdt.ls#installation
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jdtls
--lspconfig.jdtls.setup{
--    -- NOTE: Point `-data` to parent directory of your java projects and put /workspace in front of it.
--    cmd = { '/home/hx/.local/jdtls/bin/jdtls', '-data', '/home/hx/projects/java/workspace' },
--    on_attach=on_attach,
--    flags=lsp_flags,
--    handlers=handlers,
--    filetypes = { 'java' },
--    capabilities = capabilities,
--}


-- scala
-- Install `metals` language server.
-- ./coursier install metals
--require'lspconfig'.metals.setup{
--    handlers = handlers,
--    on_attach = on_attach,
--    flags = lsp_flags,
--    cmd = { "/home/hx/.local/share/coursier/bin/metals" },
--    capabilities = capabilities,
--}

-- nix
--lspconfig.rnix.setup{
--    cmd = { '/home/hx/.cargo/bin/rnix-lsp' },
--    filetypes = { 'nix' },
--    on_attach=on_attach,
--    flags=lsp_flags,
--    handlers=handlers,
--    capabilities = capabilities,
--}


-- ocaml
--lspconfig.ocamllsp.setup{
--    handlers = handlers,
--    on_attach = on_attach,
--    flags = lsp_flags,
--    cmd = { "/home/hx/.opam/default/bin/ocamllsp" }
--    capabilities = capabilities,
--}

-- go
--lspconfig.gopls.setup{
--    handlers = handlers,
--    on_attach = on_attach,
--    flags = lsp_flags,
--    capabilities = capabilities,
--}

-- purescript
--lspconfig.purescriptls.setup{
--    handlers = handlers,
--    on_attach = on_attach,
--    flags = lsp_flags,
--    capabilities = capabilities,
--}

-- racket
--lspconfig.racket_langserver.setup{
--    handlers = handlers,
--    on_attach = on_attach,
--    flags = lsp_flags,
--    capabilities = capabilities,
--}
