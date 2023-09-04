return {
  { "nil70n/omnisharp-extended", lazy = false },
  -- markdown preview
  {
    "toppair/peek.nvim",
    build = "deno task --quiet build:fast",
    keys = {
      {
        "<leader>op",
        function()
          local peek = require("peek")
          if peek.is_open() then
            peek.close()
          else
            peek.open()
          end
        end,
        desc = "Peek (Markdown Preview)",
      },
    },
    opts = { theme = "dark" }, -- 'dark' or 'light'
    init = function()
      require("which-key").register({
        ["<leader>o"] = { name = "+open" },
      })
    end,
  },
  {
    "Wansmer/treesj",
    cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
    opts = { use_default_keymaps = false },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  { "theprimeagen/harpoon" },
}
