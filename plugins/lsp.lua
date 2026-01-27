-- Setup Mason
require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

-- Get capabilities for LSP
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Lua
vim.lsp.config('lua_ls', {
  capabilities = capabilities,
  root_markers = { '.luarc.json', '.luarc.jsonc', '.luacheckrc', '.stylua.toml', 'stylua.toml', 'selene.toml', 'selene.yml', '.git' },
})

-- Python
vim.lsp.config('pyright', {
  capabilities = capabilities,
  root_markers = { 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', 'Pipfile', '.git' },
})

-- JavaScript/TypeScript
vim.lsp.config('ts_ls', {
  capabilities = capabilities,
  root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json', '.git' },
})

-- Enable the servers
vim.lsp.enable({'lua_ls', 'pyright', 'ts_ls'})
