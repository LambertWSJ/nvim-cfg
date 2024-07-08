local option = vim.opt
local buffer = vim.b
local global = vim.g
-- local option = vim.opt

option.number = true
option.relativenumber = true
option.softtabstop = 4
option.shiftwidth = 4
option.swapfile = false
option.splitright=true
option.exrc = true
option.smartindent = true
option.smartcase = true
option.autoread = true
option.autoindent = true
option.wildmenu = true
option.hlsearch = false
option.completeopt = { "menu", "menuone" }
option.smartcase = true


-- Buffer Setting --
buffer.fileenconding = "utf-8"

-- Key mappings --
vim.keymap.set("n", "<leader>bc", "<cmd>bd<CR>")

-- swap line
vim.keymap.set({"v"}, "K", ":m '<-2<CR>gv=gv", {silent = true})
vim.keymap.set({"v"}, "J", ":m '>+1<CR>gv=gv", {silent = true})


vim.keymap.set({ "v", "n" }, "<leader>y", "\"+y")


