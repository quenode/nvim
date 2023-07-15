-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

autocmd ("BufRead,BufNewFile", {
  pattern = "*.yml",
  command = "set ft=yaml.ansible",
})
-- This maping is better for me space to big
mapleader = ","
-- -- vim.ft = yaml.ansible
-- augroup('custom_fugitive_mappings',
--      --delete custom_fugitive_mappings to avoid double runs
--     au!
--     " map 'A' to stage all in git status window
--     au User FugitiveIndex nnoremap <buffer> A :Git add .<cr>
-- augroup END
