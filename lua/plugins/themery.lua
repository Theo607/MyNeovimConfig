return {
  {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      local themery = require("themery")

      themery.setup({
        themes = {
          -- gruvbox
          "gruvbox",
          -- onedark
          "onedark",
          -- tokyonight
          "tokyonight",
          "tokyonight-day",
          "tokyonight-storm",
          "tokyonight-night",
          -- catppuccin
          "catppuccin",        -- mocha default
          "catppuccin-latte",
          "catppuccin-frappe",
          "catppuccin-macchiato",
          -- nord
          "nord",
          -- everforest
          "everforest",
          -- dracula
          "dracula",
          -- vscode
          "vscode",
          -- material
          "material",
          -- habamax
          "habamax",
          -- monokai
          "monokai",
          -- nightfox
          "nightfox",
          "dayfox",
          -- rose-pine
          "rose-pine",
          "rose-pine-dawn",
          "rose-pine-moon",
          -- oxocarbon
          "oxocarbon",
          -- kanagawa
          "kanagawa",
          "kanagawa-lotus",
          "kanagawa-wave",
        },
        default_theme = "tokyonight",
      })
    end
  },

  -- Popular themes with repositories
  { "morhetz/gruvbox" },
  { "navarasu/onedark.nvim" },
  { "folke/tokyonight.nvim" },
  { "catppuccin/nvim", name = "catppuccin" },
  { "shaunsingh/nord.nvim" },
  { "sainnhe/everforest" },
  { "dracula/vim", name = "dracula" },
  { "Mofiqul/vscode.nvim" },
  { "marko-cerovac/material.nvim" },
  { "altercation/vim-colors-solarized", name = "habamax" },
  { "sickill/vim-monokai" },
  { "EdenEast/nightfox.nvim" },
  { "rose-pine/neovim", name = "rose-pine" },
  { "nyoom-engineering/oxocarbon.nvim" },
  { "rebelot/kanagawa.nvim" },
}

