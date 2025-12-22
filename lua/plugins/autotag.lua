-- lua/plugins/autotag.lua
return {
    "windwp/nvim-ts-autotag",
    config = function()
        require("nvim-ts-autotag").setup({
            enable = true,
            filetypes = { "html", "xml", "javascriptreact", "typescriptreact", "vue", "svelte" },
        })
    end,
}

