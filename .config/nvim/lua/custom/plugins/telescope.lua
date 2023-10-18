-- Other Plugins

local plugins = {
  {
    "nvim-lua/plenary.nvim",
    lazy = false,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    lazy = false,
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      local config = require("custom.configs.telescope");
      config.load_options();

      require("telescope").load_extension("file_browser")
   end
  },
}

return plugins
