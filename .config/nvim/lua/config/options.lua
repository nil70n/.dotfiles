-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt
local g = vim.g

-----------------------------------------------------
---------------- Global Variables -------------------
-----------------------------------------------------
g.OmniSharp_server_stdio = 1
g.OmniSharp_server_use_net6 = 1

g.db_ui_save_location = "~/.config/db_ui"
-----------------------------------------------------

-- GENERAL
opt.swapfile = false -- don't create swapfile
opt.signcolumn = "yes" -- always show the sign column

-- SEARCH
opt.ignorecase = true -- ignore case while searching
opt.smartcase = true -- override ignore case if search pattern contains upper case characters

-- SCROLL
opt.scrolloff = 25 -- minimum number of lines above and below the cursor

-- INDENTATION
opt.expandtab = true -- convert tabs to spaces
opt.shiftwidth = 2 -- 2 spaces for each indentation
opt.tabstop = 2 -- insert 2 spaces for tab while editing

-- REMOVE TAB LINE
vim.cmd("set showtabline=0")
