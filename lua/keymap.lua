-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap.set

-- Lazy-load a pack/x/opt plugin config, then run the action
local function on_demand(mod, fn)
  return function(...)
    require('plugins.' .. mod)
    return fn(...)
  end
end

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

-- Snacks picker
keymap("n", "<leader>ff", on_demand('snacks', function() require('snacks').picker.files() end), { desc = "Find files" })
keymap("n", "<leader>fg", on_demand('snacks', function() require('snacks').picker.grep() end), { desc = "Live grep" })
keymap("n", "<leader>fb", on_demand('snacks', function() require('snacks').picker.buffers() end), { desc = "Find buffers" })
keymap("n", "<leader>fh", on_demand('snacks', function() require('snacks').picker.help() end), { desc = "Help tags" })
keymap("n", "<leader>sr", on_demand('snacks', function() require('snacks').picker.recent() end), { desc = "Recent files" })

-- Harpoon
keymap("n", "<leader>a", on_demand('harpoon', function() require('harpoon'):list():add() end), { desc = "Harpoon: add file" })
keymap("n", "<C-e>", on_demand('harpoon', function()
  local harpoon = require('harpoon')
  harpoon.ui:toggle_quick_menu(harpoon:list())
end), { desc = "Harpoon: menu" })
keymap("n", "<leader>1", on_demand('harpoon', function() require('harpoon'):list():select(1) end), { desc = "Harpoon: file 1" })
keymap("n", "<leader>2", on_demand('harpoon', function() require('harpoon'):list():select(2) end), { desc = "Harpoon: file 2" })
keymap("n", "<leader>3", on_demand('harpoon', function() require('harpoon'):list():select(3) end), { desc = "Harpoon: file 3" })
keymap("n", "<leader>4", on_demand('harpoon', function() require('harpoon'):list():select(4) end), { desc = "Harpoon: file 4" })

-- Trouble
keymap("n", "<leader>xx", on_demand('trouble', function() vim.cmd('Trouble diagnostics toggle') end), { desc = "Diagnostics (Trouble)" })
keymap("n", "<leader>xq", on_demand('trouble', function() vim.cmd('Trouble quickfix toggle') end), { desc = "Quickfix (Trouble)" })

-- Bufferline (tabs)
keymap("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer/tab" })
keymap("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Prev buffer/tab" })
keymap("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Close buffer/tab" })

-- Markdown preview
keymap("n", "<leader>mp", on_demand('markdown-preview', function() vim.fn['mkdp#util#toggle_preview']() end), { desc = "Markdown Preview (browser)" })

-- ═══ OPTIONAL: nvim-tree keymap, delete if you remove the plugin ═══
keymap("n", "-", on_demand('nvim-tree', function() vim.cmd('NvimTreeToggle') end), { desc = "Toggle file tree" })

-- Save and quit
keymap("n", "<leader>w", ":w<CR>", { desc = "Save file" })
keymap("n", "<leader>q", ":q<CR>", { desc = "Quit" })

-- Scrolling
keymap("n", "<A-l>", "zL", { desc = "Scroll right" })
keymap("n", "<A-h>", "zH", { desc = "Scroll left" })
