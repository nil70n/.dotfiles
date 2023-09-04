-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-----------------------------------------------------
------------------- Telescope -----------------------
-----------------------------------------------------
map("n", "<leader>e", ":Telescope file_browser path=%:p:h select_buffer=true<cr>", { desc = "File Browser" })

map(
  "n",
  "<leader>fh",
  ":Telescope find_files hidden=true no_ignore=true no_ignore_parent=true<cr>",
  { desc = "Find Files (include .gitignore)" }
)

-----------------------------------------------------
-------------------- Database -----------------------
-----------------------------------------------------
map("n", "<leader>td", ":DBUIToggle<cr>", { desc = "Database UI" })

-----------------------------------------------------
------------------- TSJToggle -----------------------
-----------------------------------------------------
map("n", "<leader>j", ":TSJToggle<cr>", { desc = "Split/Join Toggle" })

-----------------------------------------------------
--------------------- Harpoon -----------------------
-----------------------------------------------------
map("n", "<leader>ht", ":lua require('harpoon.ui').toggle_quick_menu()<cr>", { desc = "Haroppn Menu" })
map("n", "<leader>hh", ":lua require('harpoon.mark').add_file()<cr>", { desc = "Haroppn Add File" })
map("n", "<leader>ha", ":lua require('harpoon.ui').nav_file(1)<cr>", { desc = "Haroppn Go to File 1" })
map("n", "<leader>hs", ":lua require('harpoon.ui').nav_file(2)<cr>", { desc = "Haroppn Go to File 2" })
map("n", "<leader>hd", ":lua require('harpoon.ui').nav_file(3)<cr>", { desc = "Haroppn Go to File 3" })
map("n", "<leader>hf", ":lua require('harpoon.ui').nav_file(4)<cr>", { desc = "Haroppn Go to File 4" })
map("n", "<leader>hg", ":lua require('harpoon.ui').nav_file(5)<cr>", { desc = "Haroppn Go to File 5" })

-----------------------------------------------------
-------------- TreeSitter Context -------------------
-----------------------------------------------------
map("n", "[c", ":lua require('treesitter-context'.go_to_context())<cr>", { desc = "Go to context", silent = true })

-----------------------------------------------------
------------------- Vimwiki -------------------------
-----------------------------------------------------
map("n", "<leader>wx", ":VimwikiToggleListItem<cr>", { desc = "Vimwiki Toggle List Item", silent = true })
