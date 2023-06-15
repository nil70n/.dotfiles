-- Keybindings overview: https://www.lunarvim.org/docs/beginners-guide/keybinds-overview

vim.g.mapleader = " "

-- Explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { noremap = true, silent = true })

-- Vimwiki
vim.keymap.set('n', '<leader>vw', '<Cmd>:VimwikiIndex<CR>', { noremap = true, silent = true, nowait = false })
vim.keymap.set('n', '<leader>vwd', '<Cmd>:VimwikiDiaryIndex<CR>', { noremap = true, silent = true, nowait = false })
vim.keymap.set('n', '<leader>vw', '<Cmd>:VimwikiMakeDiaryNote<CR>', { noremap = true, silent = true, nowait = false })

-- Dadbod
vim.keymap.set("n", "<leader>db", "<Cmd>DBUIToggle<CR>", { silent = true })
