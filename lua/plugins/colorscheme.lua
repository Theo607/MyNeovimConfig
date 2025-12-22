return {
    {
        "vague-theme/vague.nvim",
        lazy = false,      -- load immediately so colorscheme applies at start
        priority = 1000,   -- ensure it loads before other plugins
        config = function()
            vim.o.termguicolors = true
            vim.cmd([[colorscheme vague]])
        end
    }
}

