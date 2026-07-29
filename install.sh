#!/bin/bash

PACK_DIR="$HOME/AppData/Local/nvim/pack/x/start"
mkdir -p "$PACK_DIR"
cd "$PACK_DIR" || exit

echo "Installing Neovim plugins to $PACK_DIR..."

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

echo "Cloning cmp-buffer..."
git clone https://github.com/hrsh7th/cmp-buffer

echo "Cloning telescope.nvim..."
git clone https://github.com/nvim-telescope/telescope.nvim

echo "Cloning plenary.nvim..."
git clone https://github.com/nvim-lua/plenary.nvim

echo "Cloning snacks.nvim..."
git clone https://github.com/folke/snacks.nvim

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

echo "Cloning harpoon (harpoon2 branch)..."
git clone --branch harpoon2 https://github.com/ThePrimeagen/harpoon

echo "Cloning trouble.nvim..."
git clone https://github.com/folke/trouble.nvim

echo "Cloning nvim-web-devicons (trouble/nvim-tree dependency)..."
git clone https://github.com/nvim-tree/nvim-web-devicons

echo "Cloning nvim-tree.lua..."
git clone https://github.com/nvim-tree/nvim-tree.lua

echo "Cloning bufferline.nvim (tabs)..."
git clone https://github.com/akinsho/bufferline.nvim

echo "Cloning markdown-preview.nvim..."
git clone https://github.com/iamcco/markdown-preview.nvim
(cd markdown-preview.nvim/app && npm install)

echo "Done! All plugins installed."