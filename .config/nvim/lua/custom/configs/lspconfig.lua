local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfig = require("lspconfig")
local util = require "lspconfig/util"
local servers = {
  "gopls",
  "sqlls",
  "eslint",
  "tsserver",
  "svelte",
  "tailwindcss",
  "omnisharp",
  "html",
  "astro",
  "intelephense",
};

local M = {}
-- cmp has complementary completion capabilities
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Mason
require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = servers,
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      }
    }
  }
}

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = {vim.api.nvim_buf_get_name(0)},
  }

  vim.lsp.buf.execute_command(params)
end

lspconfig.tsserver.setup {
  on_attach = function (client)
    client.resolved_capabilities.document_formatting = false
  end,
  capabilities = capabilities,
  init_options = {
    preferences = {
      disableSuggestions = true
    }
  },
  commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize Imports"
    }
  },
  settings = {
    completions = {
      completeFunctionCalls = true
    }
  },
}

lspconfig.astro.setup = {
  cmd = { "astro-ls", "--stdio" },
  filetypes = { "astro" },
  init_options = { "typescript" },
  root_dir = util.root_pattern("astro.config.mjs", "tsconfig.json", "package.json")
}

M.on_attach = on_attach
M.capabilities = capabilities

return M
