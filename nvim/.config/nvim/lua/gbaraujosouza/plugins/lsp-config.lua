return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        config = function()
            require("mason-lspconfig").setup({
                automatic_enable = false,
                ensure_installed = {
                    "lua_ls",
                    "ts_ls",
                    "pyright",
                }
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            local servers = {
                ts_ls = {},
                jdtls = {},
                lua_ls = {},
                clangd = {
                    cmd = { "clangd", "--fallback-style={IndentWidth: 4, UseTab: Never}" },
                },
                pyright = {},
                prismals = {},
                tailwindcss = {},
                gopls = {
                    cmd = { "gopls" },
                    filetypes = { "go", "gomod", "gowork", "gotmpl" },
                    root_markers = { "go.work", "go.mod", ".git" }
                },
                angularls = {}
            }
            for server, config in pairs(servers) do
                config.capabilities = capabilities
                vim.lsp.config(server, config)
                vim.lsp.enable(server)
            end

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, {})
            vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, {})
            vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, {})
            vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, {})
            vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, {})
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set("n", "<leader>re", vim.lsp.buf.rename, {})
        end,
    },
}
