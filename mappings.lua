---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", 'window left'},
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", 'window right'},
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", 'window down'},
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", 'window up'},
    ["<C-p>"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<leader>rg"] = {"<cmd> live_grep <CR>","Rip grep alternative"},
    ["<leader>G"] = { "<cmd> Git <CR>", "Run Git Fugutive" },



    [";"] = { ":", "enter command mode", opts = { nowait = true } },
 },
}

-- more keybinds!

return M
