-- LSP Plugins

local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",
        "sqlls",
        "eslint-lsp",
        "prettier",
        "typescript-language-server",
        "svelte-language-server",
        "tailwindcss-language-server",
        "js-debug-adapter",
        "omnisharp",
        "html-lsp",
      }
    }
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
     require "plugins.configs.lspconfig"
     require "custom.configs.lspconfig"
    end
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = "go",
    opts = function ()
     return require "custom.configs.null-ls"
    end,
  },
  -- {
  --   "mhartingtom/formatter.nvim",
  --   event = "VeryLazy",
  --   config = function ()
  --     require "custom.configs.formatter"
  --   end
  -- },
  -- {
  --   "mfussenegger/nvim-lint",
  --   event = "VeryLazy",
  --   config = function ()
  --     require "custom.configs.lint"
  --   end
  -- },
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources =
        cmp.config.sources(vim.list_extend(opts.sources, {
          { name = "emoji" },
          { name = "vim-dadbod-completion" },
        }))
    end,
  },
  { "Hoffs/omnisharp-extended-lsp.nvim" },
}

return plugins
