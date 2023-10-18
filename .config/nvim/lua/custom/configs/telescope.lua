local action_state = require('telescope.actions.state')
local actions = require('telescope.actions')
local telescope = require("telescope")

local M = {}

M.load_options = function()
  telescope.setup{
    defaults = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
      file_ignore_patterns = { "^.git", "node_modules" },
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
    pickers = {
      file_browser = {
        hidden = {
          file_browser = true,
          folder_browser = true,
        },
        respect_gitignore = false,
        prompt_path = true,
      },
    },
  }
end

M.close_buffer = function()
  require('telescope.builtin').buffers {
    attach_mappings = function(prompt_bufnr, map)
      local delete_buf = function()
        local selection = action_state.get_current_selection()
        -- depending if you want to close or not, include this or not
        actions.close(prompt_bufnr)
        print(vim.inspect(selection))
        -- better print selection before first running this. I am not sure if it have a bufnr or if this field is named differently
        vim.api.nvim_buf_delete(selection.bufnr, { force = true })
      end

      -- mode, key, func
      -- this is just an example
      map('n', '<leader>bd', delete_buf)
      return true
    end
  }
end

return M
