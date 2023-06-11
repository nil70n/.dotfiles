-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- Keybindings overview: https://www.lunarvim.org/docs/beginners-guide/keybinds-overview

vim.opt.relativenumber = true
vim.api.nvim_set_keymap('n', '<leader>pv', '<CMD>:Ex<CR>', { noremap = true, silent = true })

lvim.transparent_window = true
lvim.colorscheme = 'rose-pine-main'

lvim.plugins = {
  { 'rose-pine/neovim', name = 'rose-pine' },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    opts = {},
  },
  {
    'Wansmer/treesj',
    keys = {
      { '<leader>m', '<CMD>TSJToggle<CR>', desc = "Toggle Treesitter Join" },
    },
    cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
    opts = { use_default_keymaps = false },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
      vim.api.nvim_set_keymap("n", "S", ":HopChar2<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "s", ":HopWord<cr>", { silent = true })
    end,
  },
}

