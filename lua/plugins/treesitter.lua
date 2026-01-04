return {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    lazy = false,
    opts = {
        ensure_installed = {
            "c", "cpp", "lua", "python", "bash",
            "javascript", "typescript", "html", "css",
            "json", "yaml", "toml", "rust", "go",
            "markdown"
        },
        sync_install = false,
        auto_install = true,
        highlight = { enable = true, additional_vim_regex_highlighting = false},
        indent = { enable = true },
    }
}

