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
            float = {border="rounded"},
            -- This line will disable inline diagnostics
            virtual_text = false
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

        local enabled_servers = { 'pylsp', 'clangd', 'gopls' }
        for _, s in ipairs(enabled_servers) do
            lsp.enable(s)
        end

        -----
        -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
        -----

        -- pylsp
        lsp.config('pylsp', {
            -- cmd = { 'pylsp' },
            settings = {
                pylsp = {
                    -- configurationSources = { 'flake8' },
                    plugins = {
                        flake8 = {
                            enabled = false,
                            ignore = { 'E501', 'E231' },
                            maxLineLength = -1,
                        },
                        black = { enabled = false },
                        autopep8 = { enabled = false },
                        mccabe = { enabled = false },
                        pycodestyle = {
                            enabled = false,
                            ignore = { 'E501', 'E231' },
                            maxLineLength = -1,
                        },
                        pyflakes = {enabled = false},
                    },
                },
            },
        })

        -- haskell
        -- lsp.config('hls', {
        --     filetypes = { 'haskell', 'lhaskell', 'cabal' },
        -- })

        -- rust
        lsp.config('rust_analyzer', {
            cmd = {
                -- "rustup", "run", "nightly", "rust-analyzer"
                "rustup", "run", "stable", "rust-analyzer"
            },
        })

        -- javascript / typescript
        -- lsp.config('tsserver', {
        --     cmd = { "npm", "exec", "typescript-language-server", "--", "--stdio" },
        -- })

        -- javascript / typescript
        -- lsp.config('denols', {
        --     cmd = { "deno", "lsp" },
        --     root_dir = lspconfig.util.root_pattern("deno.json", "package.json", "deno.jsonc", ".git"),
        -- })

        -- java
        -- to use jdtls, install it first
        -- https://github.com/eclipse/eclipse.jdt.ls#installation
        -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jdtls
        -- NOTE: Point `-data` to parent directory of your java projects and put /workspace in front of it.
        --
        -- lsp.config('jdtls', {
        --     cmd = { '/home/hx/opt/jdtls/bin/jdtls', '-data', '/home/hx/projects/java/workspace' },
        --     filetypes = { 'java' },
        -- })

        -- scala
        -- Install `metals` language server.
        -- ./coursier install metals
        -- lsp.config('metals', {
        --    cmd = { "/home/hx/.local/share/coursier/bin/metals" },
        -- })

        -- nix
        -- lsp.config('rnix', {
        --    cmd = { '/home/hx/.cargo/bin/rnix-lsp' },
        --    filetypes = { 'nix' },
        -- })

        -- ocaml
        -- lsp.config('ocamllsp', {
        --    cmd = { "/home/hx/.opam/default/bin/ocamllsp" },
        -- })

        -- elixir
        -- lsp.config('elixirls', {
        --     -- cmd = { "/home/hx/opt/elixir-ls/language_server.sh" },
        --     cmd = { "elixir-ls" },
        -- })

        -- elixir
        -- lsp.config('lexical', {
        --     cmd = { "lexical" },
        -- })
    end
}
