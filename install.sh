#!/bin/bash

cd ~/.config/nvim/pack/x/start/ || exit

echo "Installing Neovim plugins..."

echo "Cloning nvim-treesitter..."
git clone https://github.com/nvim-treesitter/nvim-treesitter

echo "Cloning nvim-lspconfig..."
git clone https://github.com/neovim/nvim-lspconfig

echo "Cloning mason.nvim..."
git clone https://github.com/williamboman/mason.nvim

echo "Cloning nvim-cmp..."
git clone https://github.com/hrsh7th/nvim-cmp

echo "Cloning cmp-nvim-lsp..."
git clone https://github.com/hrsh7th/cmp-nvim-lsp

echo "Cloning oil.nvim..."
git clone https://github.com/stevearc/oil.nvim

echo "Cloning telescope.nvim..."
git clone https://github.com/nvim-telescope/telescope.nvim

echo "Cloning plenary.nvim..."
git clone https://github.com/nvim-lua/plenary.nvim

echo "Cloning onedark.nvim..."
git clone https://github.com/navarasu/onedark.nvim

echo "Cloning gitsigns.nvim..."
git clone https://github.com/lewis6991/gitsigns.nvim

echo "Cloning lualine.nvim..."
git clone https://github.com/nvim-lualine/lualine.nvim

echo "Cloning which-key.nvim..."
git clone https://github.com/folke/which-key.nvim

echo "Cloning nvim-autopairs..."
git clone https://github.com/windwp/nvim-autopairs

echo "Cloning cmp-buffer..."
git clone https://github.com/hrsh7th/cmp-buffer

echo "Done! All plugins installed."
