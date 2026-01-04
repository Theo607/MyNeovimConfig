return {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
        require("todo-comments").setup({
            signs = true, -- show icons in the gutter
            keywords = {
                TODO = { icon = " ", color = "info" },
                FIX = { icon = " ", color = "error" },
                NOTE = { icon = " ", color = "hint" },
                HACK = { icon = " ", color = "warning" },
                WARN = { icon = " ", color = "warning" },
            },
            highlight = {
                before = "", -- "fg" or "bg" or empty
                keyword = "wide", -- "fg", "bg", "wide"
                after = "fg", -- "fg" or "bg" or empty
                pattern = [[.*<(KEYWORDS)\s*:]], -- pattern to match
            },
        })

        -- Optional keymaps
        local opts = { noremap = true, silent = true }
        vim.keymap.set("n", "]t", "<cmd>TodoTelescope<CR>", opts) -- next TODO
        vim.keymap.set("n", "[t", "<cmd>TodoTelescope<CR>", opts) -- previous TODO
    end,
}

