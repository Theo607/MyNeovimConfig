return {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local null_ls = require("null-ls")
        local sw = tostring(vim.opt.shiftwidth:get())

        local sources = {
            -- JavaScript / TypeScript / JSON / HTML / CSS / Markdown / YAML
            null_ls.builtins.formatting.prettierd.with({
                extra_args = { "--tab-width", sw, "--use-tabs", "false" },
                filetypes = { "javascript", "typescript", "typescriptreact", "javascriptreact", "json", "html", "css", "scss", "markdown", "yaml", "graphql", "vue", "svelte" },
            }),

            -- Lua
            null_ls.builtins.formatting.stylua.with({
                extra_args = { "--indent-width", sw },
            }),

            -- Python
            null_ls.builtins.formatting.black.with({ extra_args = { "--line-length", "88" } }),
            null_ls.builtins.formatting.yapf.with({
                extra_args = { string.format("--style={based_on_style: pep8, indent_width: %s}", sw) },
            }),

            -- C / C++
            null_ls.builtins.formatting.clang_format,

            -- Rust
            null_ls.builtins.formatting.rustfmt.with({ extra_args = { "--emit", "stdout" } }),

            -- Zig
            null_ls.builtins.formatting.zigfmt,

            -- Go
            null_ls.builtins.formatting.gofmt,
            null_ls.builtins.formatting.goimports,

            -- PHP
            null_ls.builtins.formatting.phpcsfixer.with({
                extra_args = { "--using-cache=no" },
            }),

            -- Assembly
            null_ls.builtins.formatting.astyle.with({
                filetypes = { "asm", "s" },
                extra_args = { string.format("--indent=spaces=%s", sw) },
            }),

            -- SQL
            null_ls.builtins.formatting.sql_formatter,

            -- Dockerfile
            null_ls.builtins.formatting.hadolint,  -- optional for linting

            -- Linters
            null_ls.builtins.diagnostics.eslint_d,
            null_ls.builtins.diagnostics.flake8,
            null_ls.builtins.diagnostics.shellcheck,
        }

        null_ls.setup({
            sources = sources,
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    -- Format keymap
                    vim.keymap.set(
                        "n",
                        "<leader>f",
                        function()
                            vim.lsp.buf.format({ bufnr = bufnr })
                        end,
                        { buffer = bufnr, desc = "Format buffer" }
                    )

                    -- Auto-format on save
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

