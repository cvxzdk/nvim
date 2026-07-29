-- Ensure pack plugins are loaded (Windows compatible)
local pack_path = vim.fn.stdpath('config') .. '\\pack\\x\\start'
vim.opt.packpath:prepend(vim.fn.stdpath('config'))

-- Add lua paths for Windows
local config_path = vim.fn.stdpath('config')
package.path = package.path .. ';' .. config_path .. '\\?.lua'
package.path = package.path .. ';' .. config_path .. '\\lua\\?.lua'

require('config')
require('keymap')

-- Load plugin configs
require('plugins.treesitter')
require('plugins.lsp')
require('plugins.cmp')
require('plugins.telescope')
require('plugins.snacks')
require('plugins.gitsigns')
require('plugins.lualine')
require('plugins.which-key')
require('plugins.autopairs')
require('plugins.harpoon')
require('plugins.trouble')
require('plugins.bufferline')
require('plugins.markdown-preview')

-- ═══ OPTIONAL: remove this one line to drop nvim-tree entirely ═══
require('plugins.nvim-tree')
