local M = {}

-- gitsigns: load only when opening a file inside a git repo
local gitsigns_loaded = false
vim.api.nvim_create_autocmd('BufEnter', {
  callback = function()
    if gitsigns_loaded then
      return
    end
    local path = vim.api.nvim_buf_get_name(0)
    if path == '' then
      return
    end
    if vim.fn.finddir('.git', vim.fn.fnamemodify(path, ':p:h') .. ';') ~= '' then
      gitsigns_loaded = true
      require('plugins.gitsigns')
    end
  end,
})

return M
