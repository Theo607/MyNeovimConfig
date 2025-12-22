#!/usr/bin/env bash

# MyNeovimConfig installation script
# Makes a backup of existing config and sets up plugins

set -e

echo "=== Installing MyNeovimConfig ==="

# Backup existing Neovim config
if [ -d "$HOME/.config/nvim" ]; then
    echo "Backing up existing Neovim config..."
    mv "$HOME/.config/nvim" "$HOME/.config/nvim.backup_$(date +%Y%m%d%H%M%S)"
fi

# Clone config
echo "Cloning MyNeovimConfig..."
git clone https://github.com/YOUR_USERNAME/MyNeovimConfig.git "$HOME/.config/nvim"

# Ensure lazy.nvim exists
if [ ! -d "$HOME/.local/share/nvim/lazy/lazy.nvim" ]; then
    echo "Installing lazy.nvim plugin manager..."
    git clone https://github.com/folke/lazy.nvim.git "$HOME/.local/share/nvim/lazy/lazy.nvim"
fi

echo "Installation complete!"
echo "Open Neovim with 'nvim' and let Lazy.nvim install all plugins."

# Optional: install dependencies for LSPs, formatting, etc.
echo "Installing optional dependencies via mason..."
nvim --headless "+MasonInstallAll" "+qa"

echo "Done! You can now open Neovim and start using your configuration."

