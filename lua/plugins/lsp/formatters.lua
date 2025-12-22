return {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local null_ls = require("null-ls")

        -- Define sources (formatters & linters)
        local sources = {
            -- Formatters
            null_ls.builtins.formatting.prettierd, -- JS/TS/JSON/etc.
            null_ls.builtins.formatting.stylua,    -- Lua
            null_ls.builtins.formatting.black,     -- Python
            null_ls.builtins.formatting.clang_format, -- C/C++
            null_ls.builtins.formatting.yapf,      -- Python alternative

            -- Linters (optional, can add more)
            null_ls.builtins.diagnostics.eslint_d,
            null_ls.builtins.diagnostics.flake8,
        }

        null_ls.setup({
            sources = sources,
            on_attach = function(client, bufnr)
                -- Buffer-local keymap for formatting
                if client.supports_method("textDocument/formatting") then
                    vim.keymap.set(
                        "n",
                        "<leader>f",
                        function()
                            vim.lsp.buf.format({ bufnr = bufnr })
                        end,
                        { buffer = bufnr, desc = "Format buffer" }
                    )

                    vim.api.nvim_create_autocmd("BufWritePre", {
                    buffer = bufnr,
                    callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                    end,
                    })
                end
            end,
        })
    end,
}

