return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function ()
        -- Disable lsp
        return

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
            client.server_capabilities.semanticTokensProvider = nil
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

        -- TEMPLATE
        -- lspconfig.LSP_NAME_IN_SERVER_CONFIGURATION.setup {
        --     handlers = handlers,
        --     on_attach = on_attach,
        --     flags = lsp_flags,
        --     capabilities = capabilities,
        -- }

        -- jedi
        -- lspconfig.jedi_language_server.setup {
        --     handlers = handlers,
        --     on_attach = on_attach,
        --     flags = lsp_flags,
        --     capabilities = capabilities,
        -- }

        -- pyright
        -- lspconfig.pyright.setup {
        --     handlers = handlers,
        --     on_attach = on_attach,
        --     flags = lsp_flags,
        --     capabilities = capabilities,
        -- }

        -- pylsp
        -- lspconfig.pylsp.setup {
        --     cmd = { "pylsp" },
        --     settings = {
        --         pylsp = {
        --             plugins = {
        --                 pycodestyle = {
        --                     enabled = false
        --                 },
        --             },
        --         },
        --     },
        --     handlers = handlers,
        --     on_attach = on_attach,
        --     flags = lsp_flags,
        --     capabilities = capabilities,
        -- }

        -- pylyzer
        -- lspconfig.pylyzer.setup {
        --     cmd = { "pylyzer", "--server" },
        --     settings = {
        --         python = {
        --             checkOnType = false,
        --             diagnostics = true,
        --             inlayHints = true,
        --             smartCompletion = true,
        --         },
        --     },
        --     handlers = handlers,
        --     on_attach = on_attach,
        --     flags = lsp_flags,
        --     capabilities = capabilities,
        -- }


        -- ruff (python linter)
        -- lspconfig.ruff_lsp.setup {
        --     cmd = { "ruff-lsp" },
        --     handlers = handlers,
        --     on_attach = on_attach,
        --     flags = lsp_flags,
        --     capabilities = capabilities,
        -- }

        -- bash
        -- lspconfig.bashls.setup {
        --     handlers = handlers,
        --     on_attach = on_attach,
        --     flags = lsp_flags,
        --     capabilities = capabilities,
        -- }

        -- lua
        -- lspconfig.lua_ls.setup {
        --     handlers = handlers,
        --     on_attach = on_attach,
        --     flags = lsp_flags,
        --     capabilities = capabilities,
        -- }

        -- C / C++ / Obj-C
        -- lspconfig.ccls.setup {
        --     handlers = handlers,
        --     on_attach = on_attach,
        --     flags = lsp_flags,
        --     capabilities = capabilities,
        --     init_options = {
        --         cache = {
        --             directory = ".ccls-cache";
        --         };
        --     },
        -- }

        -- C / C++
        -- lspconfig.clangd.setup{
        --     handlers = handlers,
        --     on_attach = on_attach,
        --     flags = lsp_flags,
        --     capabilities = capabilities,
        -- }

        -- json
        -- lspconfig.jsonls.setup {
        --     handlers = handlers,
        --     on_attach = on_attach,
        --     flags = lsp_flags,
        --     capabilities = capabilities,
        -- }

        -- haskell
        -- lspconfig.hls.setup {
        --     handlers = handlers,
        --     on_attach = on_attach,
        --     flags = lsp_flags,
        --     capabilities = capabilities,
        --     filetypes = { 'haskell', 'lhaskell', 'cabal' },
        -- }


        -- rust
        -- lspconfig.rust_analyzer.setup {
        --     cmd = {
        --         -- "rustup", "run", "nightly", "rust-analyzer"
        --         "rustup", "run", "stable", "rust-analyzer"
        --     },
        --     handlers = handlers,
        --     on_attach = on_attach,
        --     flags = lsp_flags,
        --     capabilities = capabilities,
        -- }

        -- zig
        -- lspconfig.zls.setup{
        --     handlers = handlers,
        --     on_attach = on_attach,
        --     flags = lsp_flags,
        --     capabilities = capabilities,
        -- }

        -- javascript / typescript
        -- lspconfig.tsserver.setup {
        --     cmd = { "npm", "exec", "typescript-language-server", "--", "--stdio" },
        --     handlers = handlers,
        --     on_attach = on_attach,
        --     flags = lsp_flags,
        --     capabilities = capabilities,
        -- }

        -- javascript / typescript
        -- lspconfig.denols.setup{
        --     cmd = { "deno", "lsp" },
        --     root_dir = lspconfig.util.root_pattern("deno.json", "package.json", "deno.jsonc", ".git"),
        --     handlers = handlers,
        --     on_attach = on_attach,
        --     flags = lsp_flags,
        --     capabilities = capabilities,
        -- }

        -- java
        -- to use jdtls, install it first
        -- https://github.com/eclipse/eclipse.jdt.ls#installation
        -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jdtls
        -- NOTE: Point `-data` to parent directory of your java projects and put /workspace in front of it.
        --
        -- lspconfig.jdtls.setup{
        --     cmd = { '/home/hx/opt/jdtls/bin/jdtls', '-data', '/home/hx/projects/java/workspace' },
        --     filetypes = { 'java' },
        --     handlers = handlers,
        --     on_attach = on_attach,
        --     flags = lsp_flags,
        --     capabilities = capabilities,
        -- }


        -- clojure
        -- lspconfig.clojure_lsp.setup{
        --     handlers = handlers,
        --     on_attach = on_attach,
        --     flags = lsp_flags,
        --     capabilities = capabilities,
        -- }

        -- scala
        -- Install `metals` language server.
        -- ./coursier install metals
        --require'lspconfig'.metals.setup{
        --    cmd = { "/home/hx/.local/share/coursier/bin/metals" },
        --    handlers = handlers,
        --    on_attach = on_attach,
        --    flags = lsp_flags,
        --    capabilities = capabilities,
        --}

        -- nix
        --lspconfig.rnix.setup{
        --    cmd = { '/home/hx/.cargo/bin/rnix-lsp' },
        --    filetypes = { 'nix' },
        --    handlers = handlers,
        --    on_attach = on_attach,
        --    flags = lsp_flags,
        --    capabilities = capabilities,
        --}

        -- nixd
        -- lspconfig.nixd.setup{
        --     handlers = handlers,
        --     on_attach = on_attach,
        --     flags = lsp_flags,
        --     capabilities = capabilities,
        -- }


        -- ocaml
        -- lspconfig.ocamllsp.setup{
        --    cmd = { "/home/hx/.opam/default/bin/ocamllsp" },
        --    handlers = handlers,
        --    on_attach = on_attach,
        --    flags = lsp_flags,
        --    capabilities = capabilities,
        -- }

        -- go
        -- lspconfig.gopls.setup{
        --     handlers = handlers,
        --     on_attach = on_attach,
        --     flags = lsp_flags,
        --     capabilities = capabilities,
        -- }

        -- purescript
        --lspconfig.purescriptls.setup{
        --    handlers = handlers,
        --    on_attach = on_attach,
        --    flags = lsp_flags,
        --    capabilities = capabilities,
        --}

        -- racket
        -- lspconfig.racket_langserver.setup{
        --     handlers = handlers,
        --     on_attach = on_attach,
        --     flags = lsp_flags,
        --     capabilities = capabilities,
        -- }

        -- elixir
        -- lspconfig.elixirls.setup{
        --     -- cmd = { "/home/hx/opt/elixir-ls/language_server.sh" },
        --     cmd = { "elixir-ls" },
        --     handlers = handlers,
        --     on_attach = on_attach,
        --     flags = lsp_flags,
        --     capabilities = capabilities,
        -- }

        -- elixir
        -- lspconfig.lexical.setup{
        --     cmd = { "lexical" },
        --     handlers = handlers,
        --     on_attach = on_attach,
        --     flags = lsp_flags,
        --     capabilities = capabilities,
        -- }
    end
}
