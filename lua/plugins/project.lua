local M = {
  "ahmedkhalf/project.nvim",
  -- can't use 'opts' because module has non standard name 'project_nvim'
  config = function()
    require("project_nvim").setup({
      patterns = {
        ".git",
        "package.json",
        "Makefile",
        "go.mod",
      },
      -- detection_methods = { "lsp", "pattern" },
      detection_methods = { "pattern" },
    })
  end,
}

return M
