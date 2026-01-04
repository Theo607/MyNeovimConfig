return {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        -- Add the current file to harpoon
        vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Add file to Harpoon" })

        -- Toggle harpoon menu
        vim.keymap.set("n", "<leader>m", ui.toggle_quick_menu, { desc = "Harpoon Menu" })

        -- Jump to harpoon files by index
        for i = 1, 9 do
            vim.keymap.set("n", "<leader>" .. i, function()
                ui.nav_file(i)
            end, { desc = "Harpoon " .. i })
        end
    end,
}

