if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "BufReadPost",
  opts = {
    suggestion = {
      keymap = {
        accept = false, -- handled by completion engine
      },
    },
  },
  specs = {
    {
      "AstroNvim/astrocore",
      opts = {
        options = {
          g = {
            -- set the ai_accept function
            ai_accept = function()
              if require("copilot.suggestion").is_visible() then
                require("copilot.suggestion").accept()
                return true
              end
            end,
          },
        },
      },
    },
  },
  --  {
  --    "zbirenbaum/copilot-cmp",
  --    dependencies = "copilot.lua",
  --    opts = {},
  --    config = function(_, opts)
  --      local copilot_cmp = require "copilot_cmp"
  --      copilot_cmp.setup(opts)
  --      -- attach cmp source whenever copilot attaches
  --      -- fixes lazy-loading issues with the copilot cmp source
  --      copilot_cmp._on_insert_enter()
  --    end,
  --  },
}
