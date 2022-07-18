-- augroup gomap
-- augroup END 
-- vim.api.nvim_command('autocmd FileType go imap <M-Left> <C-o>0')
-- print(vim.bo.filetype)
require('go').setup()

local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}

map('i', '<M-Left>', '<C-o>0', {noremap = true})