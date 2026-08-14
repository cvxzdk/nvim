require('mason').setup({
  ui = {
    icons = {
      package_installed = '✓',
      package_pending = '➜',
      package_uninstalled = '✗',
    },
  },
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config('*', { capabilities = capabilities })

require('mason-lspconfig').setup({
  ensure_installed = {
    'ts_ls',
    'pyright',
    'lua_ls',
    'bashls',
    'dockerls',
    'jdtls',
    'powershell_es',
    'svelte',
    'tailwindcss',
    'vue_ls',
    'yamlls',
  },
  automatic_enable = true,
})

require('mason-tool-installer').setup({
  ensure_installed = {
    'prettierd',
    'ruff',
    'shfmt',
    'google-java-format',
  },
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local buf = ev.buf
    local opts = { buffer = buf }

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>ws', function()
      vim.lsp.buf.workspace_symbol()
    end, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<leader>ld', vim.diagnostic.open_float, opts)

    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client and client.server_capabilities.documentFormattingProvider then
      vim.keymap.set('n', '<leader>fmt', function()
        vim.lsp.buf.format({ bufnr = buf })
      end, opts)
    end
  end,
})
