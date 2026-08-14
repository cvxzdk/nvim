vim.cmd.packadd('snacks.nvim')

require('snacks').setup({
  picker = {
    enabled = true,
    sources = {
      files = { exclude = { 'node_modules', '.git' } },
      grep = { exclude = { 'node_modules', '.git' } },
    },
  },
  bigfile = { enabled = true },
})
