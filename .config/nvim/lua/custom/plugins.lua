local utils = require("custom.utils.utils")

local plugins = {
  require("custom.plugins.lsp"),
  require("custom.plugins.dap"),
  require("custom.plugins.treesitter"),
  require("custom.plugins.telescope"),
  require("custom.plugins.tools"),
  require("custom.plugins.database"),
  require("custom.plugins.language"),
}

return utils.merge_packages(plugins)
