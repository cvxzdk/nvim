vim.loader.enable()

-- Ensure pack plugins are loaded (Windows compatible)
local pack_path = vim.fn.stdpath('config') .. '\\pack\\x\\start'
vim.opt.packpath:prepend(vim.fn.stdpath('config'))

-- Add lua paths for Windows
local config_path = vim.fn.stdpath('config')
package.path = package.path .. ';' .. config_path .. '\\?.lua'
package.path = package.path .. ';' .. config_path .. '\\lua\\?.lua'

-- Disable unused built-ins for faster startup
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1

require('config')
require('keymap')

-- Load startup plugin configs
require('plugins.treesitter')
require('plugins.lsp')
require('plugins.cmp')
require('plugins.lualine')
require('plugins.which-key')
require('plugins.bufferline')
require('plugins.autopairs')
require('plugins.conform')

-- Lazy-load triggers for pack/x/opt plugins
require('plugins.optimize')
