-- ═══════════════════════════════════════════════════════
-- OPTIONAL: nvim-tree file sidebar
-- Delete this file + its `require('plugins.nvim-tree')` line
-- in init.lua, plus its keymap in keymap.lua, to remove.
-- ═══════════════════════════════════════════════════════
require("nvim-tree").setup({
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})
