local M = {
  "simrat39/rust-tools.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
  },
  ft = { "rust" },
  config = function()
    require("rust-tools").setup({
      server = {
        on_attach = function(client, bufnr)
          local utils = require("plugins.lsp.utils")
          utils.custom_lsp_attach(client, bufnr)
          local wk = require("which-key")
          local default_options = { silent = true }
          wk.register({
            c = {
              name = "Coding",
              r = { "<cmd>RustRunnables<cr>", "Runnables" },
              d = { "<cmd>RustDebuggables<cr>", "Debuggables" },
            },
          }, { prefix = "<leader>", mode = "n", default_options })
        end,
      },
    })
  end,
}

return M
