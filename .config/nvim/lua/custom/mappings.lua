local M = {}

M.overrides = {
  n = {
    ["<leader>e"] = {
      "<cmd> Telescope file_browser path=%:p:h select_buffer=true <cr>",
      "Telescope File Browser"
    },
    ["<leader>bb"] = {
      "<cmd> Telescope buffers <cr>",
      "Telescope Buffers"
    },
  }
}

M.toggle = {
  n = {
    ["<leader>td"] = {
      "<cmd> DBUIToggle <cr>",
      "Toggle DB UI"
    },
  }
}

M.cmp = {
  plugin = true,
  n = {
    ["<C-j"] = {
      function ()
        local cmp = require "cmp"
        cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif require("luasnip").expand_or_jumpable() then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
          else
            fallback()
          end
        end, { "i", "s" })
      end,
      "Select next completion item"
    },
    ["<C-k"] = {
      function ()
        local cmp = require "cmp"
        cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif require("luasnip").jumpable(-1) then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
          else
            fallback()
          end
        end, { "i", "s" })
      end,
      "Select next completion item"
    },
    ['<C-y>'] = {
      function ()
        local cmp = require "cmp"
        cmp.mapping.confirm({ select = true })
      end,
      "Select the completion item"
    },
  }
}

M.dap = {
  plugin = true,
  n = {
    ["F9"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Debugging: Breakpoint"
    },
    ["F7"] = {
      function ()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Debugging: UI Sidebar"
    },
    ["<F5>"] = {
      function ()
        require('dap').continue()
      end,
      "Debugging: Continue"
    },
    ["<F10>"] = {
      function ()
        require('dap').step_over()
      end,
      "Debugging: Step Over"
    },
    ["<F11>"] = {
      function ()
        require('dap').step_into()
      end,
      "Debugging: Step Into"
    },
    ["<F12>"] = {
      function ()
        require('dap').step_out()
      end,
      "Debugging: Step Out"
    },
  }
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function ()
        require('dap-go').debug_test()
      end,
      "Debug go test"
    },
    ["<leader>dgl"] = {
      function ()
        require('dap-go').debug_last()
      end,
      "Debug last go test"
    },
  }
}

M.gopher = {
  plugin = true,
  n = {
    ["<leader>gtj"] = {
      "<cmd> GoTagAdd json <CR>",
      "Go: Add JSON tags"
    },
    ["<leader>gty"] = {
      "<cmd> GoTagAdd json <CR>",
      "Go: Add yaml tags"
    },
    ["<leader>gmt"] = {
      "<cmd> GoMod tidy <CR>",
      "Go: Run 'go mod tidy'"
    },
    ["<leader>gmi"] = {
      ":GoMod init ",
      "Go: Run 'go mod init'"
    },
    ["<leader>gii"] = {
      ":GoImpl ",
      "Go: Implement Interface"
    },
    ["<leader>gta"] = {
      "<cmd> GoTestsAll <CR>",
      "Go: Create tests for all functions in current file"
    },
    ["<leader>gie"] = {
      "<cmd> GoIfErr <CR>",
      "Go: Create 'if err'"
    },
  }
}

M.harpoon = {
  plugin = true,
  n = {
    ["<leader>a"] = {
      "<cmd>:lua require('harpoon.mark').add_file()<cr>",
    lazy = false,
      "Harpoon: Add file"
    },
    ["<leader>h"] = {
      "<cmd>:lua require('harpoon.ui').toggle_quick_menu()<cr>",
      "Harpoon: Toggle menu"
    },
    ["<M-a>"] = {
      "<cmd>:lua require('harpoon.ui').nav_file(1)<cr>",
      "Harpoon: Go to file 1"
    },
    ["<M-s>"] = {
      "<cmd>:lua require('harpoon.ui').nav_file(2)<cr>",
      "Harpoon: Go to file 2"
    },
    ["<M-d>"] = {
      "<cmd>:lua require('harpoon.ui').nav_file(3)<cr>",
      "Harpoon: Go to file 3"
    },
    ["<M-f>"] = {
      "<cmd>:lua require('harpoon.ui').nav_file(4)<cr>",
      "Harpoon: Go to file 4"
    },
    ["<M-g>"] = {
      "<cmd>:lua require('harpoon.ui').nav_file(5)<cr>",
      "Harpoon: Go to file 5"
    },
  }
}

M.peek = {
  plugin = true,
  n = {
    ["<leader>op"] = {
      "<cmd>:lua function() local peek = require('peek'); if peek.is_open() then peek.close(); else peek.open(); end end<cr>",
      "Peek: Markdown preview"
    },
  }
}

M.tsj = {
  plugin = true,
  n = {
    ["<leader>j"] = {
      "<cmd> TSJToggle <cr>",
      "Split/Join Toggle"
    },
  }
}

return M
