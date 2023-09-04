-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

----------------- Global Variables ------------------
local api = vim.api

--api.nvim_create_autocmd({ "ColorScheme" }, {
--  desc = "Make all backgrounds transparent",
--  group = api.nvim_create_augroup("nobg", { clear = true }),
--  pattern = "*",
--  callback = function()
--    api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
--    api.nvim_set_hl(0, "NormalNC", { bg = "NONE", ctermbg = "NONE" })
--    require("notify").setup({ background_colour = "#000000" })
--  end,
--})

-----------------------------------------------------
------------------ Transparency ---------------------
-----------------------------------------------------
api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
api.nvim_set_hl(0, "NormalNC", { bg = "NONE", ctermbg = "NONE" })
require("notify").setup({ background_colour = "#000000" })

-----------------------------------------------------
--------------------- Mason -------------------------
-----------------------------------------------------
-- require("mason-lspconfig").setup({ ensure_installed = { "omnisharp" } })

-----------------------------------------------------
------------ Telescope Extensions -------------------
-----------------------------------------------------
local telescope = require("telescope")

telescope.setup({
  defaults = {
    "rg",
    "--color=never",
    "--no-heading",
    "--with-filename",
    "--line-number",
    "--column",
    "--smart-case",
    "--hidden",
    file_ignore_patterns = { ".git", "node_modules" },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
    },
  },
  extensions = {
    file_browser = {
      hidden = {
        file_browser = true,
        folder_browser = true,
      },
      respect_gitignore = false,
      prompt_path = true,
    },
  },
})

telescope.load_extension("file_browser")
