#!/bin/bash

BASE="$HOME/AppData/Local/nvim/pack/x"
START="$BASE/start"
OPT="$BASE/opt"
mkdir -p "$START" "$OPT"

echo "Installing Neovim plugins to $BASE..."

clone_start() {
  local url="$1"
  local dir="${2:-$(basename "$url" .git)}"
  git clone --depth 1 "$url" "$START/$dir"
}

clone_opt() {
  local url="$1"
  local dir="${2:-$(basename "$url" .git)}"
  git clone --depth 1 "$url" "$OPT/$dir"
}

echo "Cloning nvim-treesitter..."
clone_start https://github.com/nvim-treesitter/nvim-treesitter

echo "Cloning nvim-lspconfig..."
clone_start https://github.com/neovim/nvim-lspconfig

echo "Cloning mason.nvim..."
clone_start https://github.com/williamboman/mason.nvim

echo "Cloning mason-lspconfig.nvim..."
clone_start https://github.com/williamboman/mason-lspconfig.nvim

echo "Cloning mason-tool-installer.nvim..."
clone_start https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim

echo "Cloning nvim-cmp..."
clone_start https://github.com/hrsh7th/nvim-cmp

echo "Cloning cmp-nvim-lsp..."
clone_start https://github.com/hrsh7th/cmp-nvim-lsp

echo "Cloning cmp-buffer..."
clone_start https://github.com/hrsh7th/cmp-buffer

echo "Cloning cmp-path..."
clone_start https://github.com/hrsh7th/cmp-path

echo "Cloning cmp-cmdline..."
clone_start https://github.com/hrsh7th/cmp-cmdline

echo "Cloning onedark.nvim..."
clone_start https://github.com/navarasu/onedark.nvim

echo "Cloning nvim-web-devicons..."
clone_start https://github.com/nvim-tree/nvim-web-devicons

echo "Cloning which-key.nvim..."
clone_start https://github.com/folke/which-key.nvim

echo "Cloning lualine.nvim..."
clone_start https://github.com/nvim-lualine/lualine.nvim

echo "Cloning nvim-autopairs..."
clone_start https://github.com/windwp/nvim-autopairs

echo "Cloning bufferline.nvim (tabs)..."
clone_start https://github.com/akinsho/bufferline.nvim

echo "Cloning conform.nvim (format on save)..."
clone_start https://github.com/stevearc/conform.nvim

echo "Cloning snacks.nvim (lazy)..."
clone_opt https://github.com/folke/snacks.nvim

echo "Cloning gitsigns.nvim (lazy)..."
clone_opt https://github.com/lewis6991/gitsigns.nvim

echo "Cloning harpoon (harpoon2 branch, lazy)..."
git clone --depth 1 --branch harpoon2 https://github.com/ThePrimeagen/harpoon "$OPT/harpoon"

echo "Cloning trouble.nvim (lazy)..."
clone_opt https://github.com/folke/trouble.nvim

echo "Cloning markdown-preview.nvim (lazy)..."
clone_opt https://github.com/iamcco/markdown-preview.nvim
(cd "$OPT/markdown-preview.nvim/app" && npm install)

echo "Cloning nvim-tree.lua (lazy)..."
clone_opt https://github.com/nvim-tree/nvim-tree.lua

echo ""
echo "Done! LSP servers + formatters auto-install via Mason when you open matching files."
echo "Track progress with :Mason."
