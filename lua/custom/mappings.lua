---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },

    -- quick opts
    ["J"] = { "5j", "Scroll 5 lines down" },
    ["K"] = { "5k", "Scroll 5 lines up" },
    ["S"] = { ":w<CR>", "Save file" },
    ["Q"] = { ":q<CR>", "Quit" },

    -- Venv-selector
    ["<leader>vs"] = { ":VenvSelect<CR>", "Open VenvSelector" },
    ["<leader>vc"] = {
      ":VenvSelectCached<CR>",
      "Retrieve the venv from a cache"},

    -- Copilot
    ["<leader>go"] = { ":Copilot<CR>", "Open Copilot" },
    ["<leader>ge"] = { ":Copilot enable", "Enable Copilot" },
    ["leader>gd"] = { ":Copilot disable", "Disable Copilot" },

    -- Cellular
    ["<leader>rr"] = { ":CellularAutomaton make_it_rain<CR>", "Make it rain" },
    ["<leader>rg"] = { ":CellularAutomaton game_of_life<CR>", "Game of life" },

    -- LazyGit
    ["<leader>gg"] = { ":LazyGit<CR>", "Open LazyGit" },

    -- Notify
    [",;"] = {
      function()
        require("telescope").extensions.notify.notify {
          layout_strategy = "vertical",
          layout_config = {
            width = 0.9,
            height = 0.9,
            -- preview_height = 0.1,
          },
          wrap_results = true,
          previewer = false,
        }
      end,
      "Filter Notifications",
    },
  },

  v = {
    [">"] = { ">gv", "indent" },
  },
  i = {
    ["jj"] = { "<ESC>", "ESC" },
  },
}

-- more keybinds!

return M
