-- General tools

local plugins = {
  { "rose-pine/neovim", name = "rose-pine" },
  {
    "toppair/peek.nvim",
    lazy = false,
    build = "deno task --quiet build:fast",
    opts = { theme = "dark" }, -- 'dark' or 'light'
    config = function ()
      require("core.utils").load_mappings("peek")
    end
  },
  {
    "Wansmer/treesj",
    lazy = false,
    cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
    opts = { use_default_keymaps = false },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function ()
      require("treesj").setup()
      require("core.utils").load_mappings("tsj")
    end
  },
  {
    "theprimeagen/harpoon",
    lazy = false,
    config = function ()
      require("core.utils").load_mappings("harpoon")
    end
  },
  {
    "vimwiki/vimwiki",
    lazy = false,
    init = function()
      vim.g.vimwiki_list = {
        {
          path = "~/vimwiki",
          syntax = "markdown",
          ext = ".md",
        },
      }
      vim.g.vimwiki_ext2syntax = {
        [".md"] = "markdown",
        [".markdown"] = "markdown",
        [".mdown"] = "markdown",
      }
    end,
  },
}

return plugins
