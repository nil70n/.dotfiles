-- DAP Plugins

local plugins = {
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function ()
      local dap = require("dap")
      local dapui = require("dapui")

      require("dapui").setup()

      dap.listeners.after.event_initialized["dapui_config"] = function ()
        dapui.open()
      end

      dap.listeners.before.event_terminated["dapui_config"] = function ()
        dapui.close()
      end

      dap.listeners.before.event_exited["dapui_config"] = function ()
        dapui.close()
      end
    end
  },
  {
    "mfussenegger/nvim-dap",
    init = function ()
      require("custom.configs.dap")
      require("core.utils").load_mappings("dap")
      require("dap.ext.vscode").load_launchjs()
    end
  },
}

return plugins
