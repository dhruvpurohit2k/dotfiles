
--set relativenumber
vim.opt.relativenumber = true
--How the white spaces appear in nvim
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 15
-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
