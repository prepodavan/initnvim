local api = vim.api
local project_nvim = require("project_nvim.project")

local M = {}

function M.setup()
  api.nvim_create_autocmd({ "VimEnter", "TabNew" }, {
    callback = function(ev)
      if project_nvim.get_project_root() ~= nil then
        require("neo-tree.command").execute({})
      end
    end,
  })
end

return M
