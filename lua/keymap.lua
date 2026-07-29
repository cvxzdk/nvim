-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap.set

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Resize windows
keymap("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
keymap("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
keymap("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
keymap("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Better indenting
keymap("v", "<", "<gv", { desc = "Indent left" })
keymap("v", ">", ">gv", { desc = "Indent right" })

-- Move text up and down
keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move text down" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move text up" })

-- Stay in visual mode when pasting
keymap("x", "p", '"_dP', { desc = "Paste without yanking" })

-- Clear search highlight
keymap("n", "<Esc>", ":noh<CR>", { desc = "Clear search highlight" })

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })

-- Snacks picker
keymap("n", "<leader>sf", function() Snacks.picker.files() end, { desc = "Snacks: Find files" })
keymap("n", "<leader>sg", function() Snacks.picker.grep() end, { desc = "Snacks: Live grep" })
keymap("n", "<leader>sb", function() Snacks.picker.buffers() end, { desc = "Snacks: Buffers" })
keymap("n", "<leader>sh", function() Snacks.picker.help() end, { desc = "Snacks: Help tags" })
keymap("n", "<leader>sr", function() Snacks.picker.recent() end, { desc = "Snacks: Recent files" })

-- Harpoon
local harpoon = require("harpoon")
keymap("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon: add file" })
keymap("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon: menu" })
keymap("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Harpoon: file 1" })
keymap("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Harpoon: file 2" })
keymap("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Harpoon: file 3" })
keymap("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Harpoon: file 4" })

-- Trouble
keymap("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Diagnostics (Trouble)" })
keymap("n", "<leader>xq", "<cmd>Trouble quickfix toggle<CR>", { desc = "Quickfix (Trouble)" })

-- Bufferline (tabs)
keymap("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer/tab" })
keymap("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Prev buffer/tab" })
keymap("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Close buffer/tab" })

-- Markdown preview
keymap("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", { desc = "Markdown Preview (browser)" })

-- ═══ OPTIONAL: nvim-tree keymap, delete if you remove the plugin ═══
keymap("n", "-", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file tree" })

-- Save and quit
keymap("n", "<leader>w", ":w<CR>", { desc = "Save file" })
keymap("n", "<leader>q", ":q<CR>", { desc = "Quit" })

-- Scrolling
keymap("n", "<A-l>", "zL", { desc = "Scroll right" })
keymap("n", "<A-h>", "zH", { desc = "Scroll left" })