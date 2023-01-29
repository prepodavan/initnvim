local M = {}

local function configure()
  local dap_breakpoint = {
    error = {
      text = "🟥",
      texthl = "LspDiagnosticsSignError",
      linehl = "",
      numhl = "",
    },
    rejected = {
      text = "RJ",
      texthl = "LspDiagnosticsSignHint",
      linehl = "",
      numhl = "",
    },
    stopped = {
      text = "⭐️",
      texthl = "LspDiagnosticsSignInformation",
      linehl = "DiagnosticUnderlineInfo",
      numhl = "LspDiagnosticsSignInformation",
    },
  }

  vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
  vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
  vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)
end

local function configure_exts()
  -- require("dapui").setup()
  require("nvim-dap-virtual-text").setup({
    commented = true,
  })

  local dap, dapui = require("dap"), require("dapui")
  dapui.setup({}) -- use default
  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open({})
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close({})
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close({})
  end
end

local function configure_debuggers()
  require("plugins.dap.python").setup()
  require("plugins.dap.go").setup()
end

local function create_mapping()
  local wk = require("which-key")
  wk.register({
    d = {
      name = "Debug",
      t = { "<cmd>lua require('dap').toggle_breakpoint()<cr>", "Toggle breakpoint" },
      c = { "<cmd>lua require('dap').continue()<cr>", "DAP continue" },
      q = { "<cmd>lua require('plugins.dap.dap').close_all()<cr>", "Close all" },
    },
  }, { prefix = "<leader>", mode = "n", { silent = true } })
end

function M.setup()
  configure() -- Configuration
  configure_exts() -- Extensions
  configure_debuggers() -- Debugger
  create_mapping() -- which-key mapping
end

function M.close_all()
  require("dapui").close()
  local dap = require("dap")
  dap.disconnect()
  dap.close()
end

return M
