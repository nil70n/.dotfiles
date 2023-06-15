lvim.plugins = {
  { 'rose-pine/neovim',            name = 'rose-pine' },
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
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>.s", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = true,
  },
  { "vimwiki/vimwiki" },
  -- {
  --   "kylechui/nvim-surround",
  --   version = "*", -- Use for stability; omit to use `main` branch for the latest features
  --   event = "VeryLazy",
  --   opts = {},
  -- },
  { 'tpope/vim-dadbod' },
  { 'kristijanhusak/vim-dadbod-ui' },
  -- { 'nvim-treesitter/playground' },
  -- { 'theprimeagen/harpoon', enabled = false
  -- opts = function(_, opts)
  --   local mark = require("harpoon.mark")
  --   local ui = require("harpoon.ui")
  --   local tmux = require("harpoon.tmux")

  --   vim.api.nvim_set_keymap("n", "<leader>a", mark.add_file)
  --   vim.api.nvim_set_keymap("n", "<C-e>", ui.toggle_quick_menu)

  --   vim.api.nvim_set_keymap("n", "<C-a>", function() ui.nav_file(1) end)
  --   vim.api.nvim_set_keymap("n", "<C-s>", function() ui.nav_file(2) end)
  --   vim.api.nvim_set_keymap("n", "<C-d>", function() ui.nav_file(3) end)
  --   vim.api.nvim_set_keymap("n", "<C-f>", function() ui.nav_file(4) end)
  --   vim.api.nvim_set_keymap("n", "<C-g>", function() ui.nav_file(5) end)

  --   vim.api.nvim_set_keymap("n", "<S-a>", function() tmux.sendCommand(1, "pwd") end)
  --   vim.api.nvim_set_keymap("n", "<S-s>", function() tmux.sendCommand(2, "pwd") end)
  --   vim.api.nvim_set_keymap("n", "<S-d>", function() tmux.sendCommand(3, "pwd") end)
  --   vim.api.nvim_set_keymap("n", "<S-f>", function() tmux.sendCommand(4, "pwd") end)
  --   vim.api.nvim_set_keymap("n", "<S-g>", function() tmux.sendCommand(5, "pwd") end)
  -- end,
  -- },
  -- { 'tpope/vim-fugitive', enabled = false },
}
