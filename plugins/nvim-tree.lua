-- ═══════════════════════════════════════════════════════
-- OPTIONAL: nvim-tree file sidebar
-- Delete this file + its keymap in keymap.lua to remove.
-- ═══════════════════════════════════════════════════════
vim.cmd.packadd('nvim-tree.lua')

require('nvim-tree').setup({
  view = {
    width = 24,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
  on_attach = function(bufnr)
    local api = require('nvim-tree.api')
    api.config.mappings.default_on_attach(bufnr)
    vim.keymap.set('n', '-', '<cmd>NvimTreeToggle<CR>', {
      buffer = bufnr,
      desc = 'Toggle tree',
      silent = true,
      nowait = true,
    })
  end,
})
