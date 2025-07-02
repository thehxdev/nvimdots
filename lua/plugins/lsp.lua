return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function ()
        -- Disable lsp
        -- if true then
        --     return
        -- end

        local lsp = vim.lsp
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        vim.diagnostic.config({
            float={border="rounded"},
            virtual_text=false -- This line will disable inline diagnostics
        })

        local handlers =  {
            ["textDocument/hover"] =  lsp.with(lsp.handlers.hover, {border = "rounded"}),
            ["textDocument/signatureHelp"] =  lsp.with(lsp.handlers.signature_help, {border = "rounded" }),
        }

        local keymap = vim.keymap.set
        local opts = { noremap=true, silent=true }
        keymap('n', 'gl', vim.diagnostic.open_float, opts)
        keymap('n', 'gL', vim.diagnostic.setloclist, opts)
        keymap('n', 'gd', lsp.buf.definition, opts)
        keymap('n', 'gD', lsp.buf.declaration, opts)
        keymap('n', 'gr', lsp.buf.references, opts)
        keymap('n', 'K',  lsp.buf.hover, opts)

        lsp.config('*', {
            -- on_attach = function(client, bufnr)
            --     local buf_keymap = vim.api.nvim_buf_set_keymap
            --     local bufopts = { noremap=true, silent=true }
            --     client.server_capabilities.semanticTokensProvider = nil
            --     buf_keymap(bufnr, 'n', 'gd', lsp.buf.definition, bufopts)
            --     buf_keymap(bufnr, 'n', 'gD', lsp.buf.declaration, bufopts)
            --     buf_keymap(bufnr, 'n', 'gr', lsp.buf.references, bufopts)
            --     buf_keymap(bufnr, 'n', 'K',  lsp.buf.hover, bufopts)
            -- end,
            capabilities = capabilities,
            handlers = handlers,
            -- flags = {
            --     debounce_text_changes = 150,
            -- }
        })

        -- local 

        -----
        -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
        -----

        -- TEMPLATE
        -- lsp.enabel('LSP_NAME_IN_SERVER_CONFIGURATION', {
        --     handlers = handlers,
        --     on_attach = on_attach,
        --     capabilities = capabilities,
        -- })

        -- pylsp
        lsp.enable('pylsp', {
            cmd = { 'pylsp' },
        })

        -- ruff (python linter)
        -- lsp.enable('ruff_lsp', {
        --     cmd = { 'ruff-lsp' },
        -- })

        -- bash
        -- lsp.enable('bashls')

        -- lua
        -- lsp.enable('lua_ls')

        -- C / C++
        lsp.enable('clangd')

        -- json
        -- lsp.enable('jsonls')

        -- haskell
        -- lsp.enable('hls', {
        --     filetypes = { 'haskell', 'lhaskell', 'cabal' },
        -- })


        -- rust
        lsp.enable('rust_analyzer', {
            cmd = {
                -- "rustup", "run", "nightly", "rust-analyzer"
                "rustup", "run", "stable", "rust-analyzer"
            },
        })

        -- zig
        lsp.enable('zls')

        -- javascript / typescript
        -- lsp.enable('tsserver', {
        --     cmd = { "npm", "exec", "typescript-language-server", "--", "--stdio" },
        -- })

        -- javascript / typescript
        -- lsp.enable('denols', {
        --     cmd = { "deno", "lsp" },
        --     root_dir = lspconfig.util.root_pattern("deno.json", "package.json", "deno.jsonc", ".git"),
        -- })

        -- java
        -- to use jdtls, install it first
        -- https://github.com/eclipse/eclipse.jdt.ls#installation
        -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jdtls
        -- NOTE: Point `-data` to parent directory of your java projects and put /workspace in front of it.
        --
        -- lsp.enable('jdtls', {
        --     cmd = { '/home/hx/opt/jdtls/bin/jdtls', '-data', '/home/hx/projects/java/workspace' },
        --     filetypes = { 'java' },
        -- })


        -- clojure
        -- lsp.enable('clojure_lsp')

        -- scala
        -- Install `metals` language server.
        -- ./coursier install metals
        -- lsp.enable('metals', {
        --    cmd = { "/home/hx/.local/share/coursier/bin/metals" },
        -- })

        -- nix
        -- lsp.enable('rnix', {
        --    cmd = { '/home/hx/.cargo/bin/rnix-lsp' },
        --    filetypes = { 'nix' },
        -- })

        -- nixd
        -- lsp.enable('nixd')


        -- ocaml
        -- lsp.enable('ocamllsp', {
        --    cmd = { "/home/hx/.opam/default/bin/ocamllsp" },
        -- })

        -- go
        lsp.enable('gopls')

        -- purescript
        -- lsp.enable('purescriptls')

        -- racket
        -- lsp.enable('racket_langserver')

        -- elixir
        -- lsp.enable('elixirls', {
        --     -- cmd = { "/home/hx/opt/elixir-ls/language_server.sh" },
        --     cmd = { "elixir-ls" },
        -- })

        -- elixir
        -- lsp.enable('lexical', {
        --     cmd = { "lexical" },
        -- })
    end
}
