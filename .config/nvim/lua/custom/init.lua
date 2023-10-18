local opt = vim.opt
local g = vim.g
local tabufline_opts = require("core.utils").load_config().ui.tabufline

-----------------------------------------------------
---------------- Global Variables -------------------
-----------------------------------------------------
--g.OmniSharp_server_stdio = 1
--g.OmniSharp_server_use_net6 = 1

g.db_ui_save_location = "~/.config/db_ui"
-----------------------------------------------------

-- GENERAL
opt.swapfile = false -- don't create swapfile
opt.signcolumn = "yes" -- always show the sign column
opt.relativenumber = true

-- SEARCH
opt.ignorecase = true -- ignore case while searching
opt.smartcase = true -- override ignore case if search pattern contains upper case characters

-- SCROLL
opt.scrolloff = 20 -- minimum number of lines above and below the cursor

-- INDENTATION
--opt.expandtab = true -- convert tabs to spaces
--opt.shiftwidth = 2 -- 2 spaces for each indentation
--opt.tabstop = 2 -- insert 2 spaces for tab while editing

-- Remove tab line
tabufline_opts.enabled = false
vim.cmd("set showtabline=0")

-- Disable persistent undo
vim.opt.undofile = false

vim.filetype.add({
    extension = {
        astro = "astro"
    }
})

vim.filetype.add({
	extension = {
		mdx = "markdown.mdx",
	},
	filename = {},
	pattern = {},
})

g.user_emmet_leader_key='<F6>'

vim.keymap.set('', '<Tab>', '<Nop>', { noremap=true, silent=true });
vim.keymap.set('', '<S-Tab>', '<Nop>', { noremap=true, silent=true });
vim.keymap.set('', '<C-p>', '<Nop>', { noremap=true, silent=true });
vim.keymap.set('', '<C-n>', '<Nop>', { noremap=true, silent=true });
-- vim.keymap.set('', '<CR>', '<Nop>', { noremap=true, silent=true });
