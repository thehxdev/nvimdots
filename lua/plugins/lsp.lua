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
            -- client.server_capabilities.semanticTokensProvider = nil
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
        -- lsp.enabel('LSP_NAME_IN_SERVER_CONFIGURATION', {
        --     handlers = handlers,
        --     on_attach = on_attach,
        --     flags = lsp_flags,
        --     capabilities = capabilities,
        -- })

        -- pylsp
        lsp.enable('pylsp', {
            cmd = { 'pylsp' },
            handlers = handlers,
            on_attach = on_attach,
            flags = lsp_flags,
            capabilities = capabilities,
        })

        -- ruff (python linter)
        -- lsp.enable('ruff_lsp', {
        --     cmd = { 'ruff-lsp' },
        --     handlers = handlers,
        --     on_attach = on_attach,
        --     flags = lsp_flags,
        --     capabilities = capabilities,
        -- })

        -- bash
        -- lsp.enable('bashls', {
        --     handlers = handlers,
        --     on_attach = on_attach,
        --     flags = lsp_flags,
        --     capabilities = capabilities,
        -- })

        -- lua
        -- lsp.enable('lua_ls', {
        --     handlers = handlers,
        --     on_attach = on_attach,
        --     flags = lsp_flags,
        --     capabilities = capabilities,
        -- })

        -- C / C++
        lsp.enable('clangd', {
            handlers = handlers,
            on_attach = on_attach,
            flags = lsp_flags,
            capabilities = capabilities,
        })

        -- json
        -- lsp.enable('jsonls', {
        --     handlers = handlers,
        --     on_attach = on_attach,
        --     flags = lsp_flags,
        --     capabilities = capabilities,
        -- })

        -- haskell
        -- lsp.enable('hls', {
        --     handlers = handlers,
        --     on_attach = on_attach,
        --     flags = lsp_flags,
        --     capabilities = capabilities,
        --     filetypes = { 'haskell', 'lhaskell', 'cabal' },
        -- })


        -- rust
        lsp.enable('rust_analyzer', {
            cmd = {
                -- "rustup", "run", "nightly", "rust-analyzer"
                "rustup", "run", "stable", "rust-analyzer"
            },
            handlers = handlers,
            on_attach = on_attach,
            flags = lsp_flags,
            capabilities = capabilities,
        })

        -- zig
        lsp.enable('zls', {
            handlers = handlers,
            on_attach = on_attach,
            flags = lsp_flags,
            capabilities = capabilities,
        })

        -- javascript / typescript
        -- lsp.enable('tsserver', {
        --     cmd = { "npm", "exec", "typescript-language-server", "--", "--stdio" },
        --     handlers = handlers,
        --     on_attach = on_attach,
        --     flags = lsp_flags,
        --     capabilities = capabilities,
        -- })

        -- javascript / typescript
        -- lsp.enable('denols', {
        --     cmd = { "deno", "lsp" },
        --     root_dir = lspconfig.util.root_pattern("deno.json", "package.json", "deno.jsonc", ".git"),
        --     handlers = handlers,
        --     on_attach = on_attach,
        --     flags = lsp_flags,
        --     capabilities = capabilities,
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
        --     handlers = handlers,
        --     on_attach = on_attach,
        --     flags = lsp_flags,
        --     capabilities = capabilities,
        -- })


        -- clojure
        -- lsp.enable('clojure_lsp', {
        --     handlers = handlers,
        --     on_attach = on_attach,
        --     flags = lsp_flags,
        --     capabilities = capabilities,
        -- })

        -- scala
        -- Install `metals` language server.
        -- ./coursier install metals
        -- lsp.enable('metals', {
        --    cmd = { "/home/hx/.local/share/coursier/bin/metals" },
        --    handlers = handlers,
        --    on_attach = on_attach,
        --    flags = lsp_flags,
        --    capabilities = capabilities,
        -- })

        -- nix
        -- lsp.enable('rnix', {
        --    cmd = { '/home/hx/.cargo/bin/rnix-lsp' },
        --    filetypes = { 'nix' },
        --    handlers = handlers,
        --    on_attach = on_attach,
        --    flags = lsp_flags,
        --    capabilities = capabilities,
        -- })

        -- nixd
        -- lsp.enable('nixd', {
        --     handlers = handlers,
        --     on_attach = on_attach,
        --     flags = lsp_flags,
        --     capabilities = capabilities,
        -- })


        -- ocaml
        -- lsp.enable('ocamllsp', {
        --    cmd = { "/home/hx/.opam/default/bin/ocamllsp" },
        --    handlers = handlers,
        --    on_attach = on_attach,
        --    flags = lsp_flags,
        --    capabilities = capabilities,
        -- })

        -- go
        lsp.enable('gopls', {
            handlers = handlers,
            on_attach = on_attach,
            flags = lsp_flags,
            capabilities = capabilities,
        })

        -- purescript
        -- lsp.enable('purescriptls', {
        --    handlers = handlers,
        --    on_attach = on_attach,
        --    flags = lsp_flags,
        --    capabilities = capabilities,
        -- })

        -- racket
        -- lsp.enable('racket_langserver', {
        --     handlers = handlers,
        --     on_attach = on_attach,
        --     flags = lsp_flags,
        --     capabilities = capabilities,
        -- })

        -- elixir
        -- lsp.enable('elixirls', {
        --     -- cmd = { "/home/hx/opt/elixir-ls/language_server.sh" },
        --     cmd = { "elixir-ls" },
        --     handlers = handlers,
        --     on_attach = on_attach,
        --     flags = lsp_flags,
        --     capabilities = capabilities,
        -- })

        -- elixir
        -- lsp.enable('lexical', {
        --     cmd = { "lexical" },
        --     handlers = handlers,
        --     on_attach = on_attach,
        --     flags = lsp_flags,
        --     capabilities = capabilities,
        -- })
    end
}
