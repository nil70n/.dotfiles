-- Treesitter

local plugins = {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    opts = {
    ensure_installed = {
      'astro',
      'typescript',
      'html',
      'css',
      'c_sharp',
    },
    auto_install = true,
    highlight = { enable = true }
    }
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    lazy = false,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      enable = true,
      max_lines = 0,
      min_window_height = 0,
      line_numbers = true,
      multiline_threshold = 20,
      trim_scope = "outer",
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = false,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
}

return plugins
