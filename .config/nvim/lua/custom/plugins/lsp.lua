-- LSP Plugins

local plugins = {
  {
    "williamboman/mason.nvim",
    lazy = false,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    dependencies = { "williamboman/mason.nvim" },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function ()
     require "plugins.configs.lspconfig"
     require "custom.configs.lspconfig"
      require("core.utils").load_mappings("cmp")
    end
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    lazy = false,
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
    lazy = false,
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

  -- Add external reference handler for C#
  {
    "hoffs/omnisharp-extended-lsp.nvim",
    lazy = false,
    name = "omnisharp_extended",
    url = "https://github.com/Hoffs/omnisharp-extended-lsp.nvim.git",
  },

  -- Go tools
  {
    "leoluz/nvim-dap-go",--   "dreamsofcode-io/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function (_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings("dap_go")
    end
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function (_, opts)
      require("gopher").setup(opts)
      require("core.utils").load_mappings("gopher")
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },

  -- PHP
  {
    "adalessa/laravel.nvim",
    lazy = false,
    dependencies = {
      "rcarriga/nvim-notify",
      "nvim-telescope/telescope.nvim",
      "MunifTanjim/nui.nvim",
    },
    cmd = { "Sail", "Artisan", "Composer", "Npm", "Laravel", "LaravelInfo", "DockerCompose" },
    keys = {
      { "<leader>la", ":Laravel artisan<cr>", desc = "Laravel Application Commands" },
      { "<leader>lr", ":Laravel routes<cr>", desc = "Laravel Application Routes" },
      {
        "<leader>lt",
        function()
          require("laravel.tinker").send_to_tinker()
        end,
        mode = "v",
        desc = "Laravel Application Routes",
      },
    },
    init = function()
      vim.g.laravel_log_level = "debug"
    end,
    config = function()
      -- local uid = vim._system('{ "id", "-u" }, { text = true }'):wait().stdout or "1000"
      -- local gid = vim._system('{ "id", "-g" }, { text = true }'):wait().stdout or "1000"
      local uid = "1000"
      local gid = "1000"

      local user_arg = string.format("%s:%s", vim.trim(uid), vim.trim(gid))

      require("laravel").setup {
        route_info = {
          position = "top",
        },
        environment = {
          environments = {
            ["ao"] = require("laravel.environment.docker_compose").setup {
              container_name = "panel-webserver",
              cmd = { "docker", "compose", "exec", "-u", user_arg, "-it", "panel-webserver" },
            },
          },
        },
      }
      require("telescope").load_extension "laravel"

      -- Treesitter parser for blade
      local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
      parser_config.blade = {
        install_info = {
          url = "https://github.com/EmranMR/tree-sitter-blade",
          files = {"src/parser.c"},
          branch = "main",
        },
        filetype = "blade"
      }
    end,
  },
  {
    "jwalton512/vim-blade",
    lazy = false,
  },

}

return plugins
