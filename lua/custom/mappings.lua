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
  },

  v = {
    [">"] = { ">gv", "indent" },
  },
  i = {
    ["jj"] = { "<ESC>", "ESC" },
  },
}

M.venv_selector = {
  n = {
    ["<leader>vs"] = { ":VenvSelect<CR>", "Open VenvSelector" },
    ["<leader>vc"] = {
      ":VenvSelectCached<CR>",
      "Retrieve the venv from a cache",
    },
  },
}

M.copilot = {
  n = {
    ["<leader>go"] = { ":Copilot<CR>", "Open Copilot" },
    ["<leader>ge"] = { ":Copilot enable", "Enable Copilot" },
    ["leader>gd"] = { ":Copilot disable", "Disable Copilot" },
  },
}

M.cellular = {
  n = {
    ["<leader>rr"] = { ":CellularAutomaton make_it_rain<CR>", "Make it rain" },
    ["<leader>rg"] = { ":CellularAutomaton game_of_life<CR>", "Game of life" },
  },
}

M.lazy_git = {
  n = {
    ["<leader>gg"] = { ":LazyGit<CR>", "Open LazyGit" },
  },
}

M.notify = {
  n = {
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
    ["<leader>c"] = {
      function()
        require("notify").dismiss()
      end,
      "Dismiss Notification",
    },
  },
}

M.drop_bar = {
  n = {
    ["<leader>;"] = {
      function()
        require("dropbar.api").pick()
      end,
      "Open DropBar",
    },
    ["[c"] = {
      function()
        require("dropbar.api").goto_context_start()
      end,
      "Previous Context",
    },
    ["]c"] = {
      function()
        require("dropbar.api").select_next_context()
      end,
      "Next Context",
    },
  },
}

M.todo_comment = {
  n = {
    ["<leader>t"] = { ":TodoLocList<CR>", "List TODOs" },
    ["<leader>tt"] = { ":TodoTelescope<CR>", "Search TODOs" },
    ["]t"] = {
      function()
        require("todo-comments").jump_next()
      end,
      "Next TODO",
    },
    ["[t"] = {
      function()
        require("todo-comments").jump_prev()
      end,
      "Previous TODO",
    },
  },
}

M.markdown_preview = {
  n = {
    ["<leader>md"] = { ":MarkdownPreview<CR>", "Open Markdown Preview" },
  },
}

M.trouble = {
  n = {
    ["<leader>px"] = { ":Trouble<CR>", "Open Trouble" },
    ["<leader>pw"] = { ":Trouble workspace_diagnostics<CR>", "Workspace Diagnostics" },
    ["<leader>pd"] = { ":Trouble document_diagnostics<CR>", "Document Diagnostics" },
    ["<leader>pl"] = { ":Trouble loclist<CR>", "Loclist" },
    ["<leader>pq"] = { ":Trouble quickfix<CR>", "Quickfix" },
  },
}

M.handle_URL = {
  n = {
    ["<leader>u"] = { ":HandleURL<CR>", "Open url in browser" },
  },
}

M.neo_tree = {
  n = {
    -- toggle
    ["<C-n>"] = { "<cmd> Neotree toggle <CR>", "Toggle nvimtree" },

    -- focus
    ["<leader>e"] = { "<cmd> Neotree focus <CR>", "Focus nvimtree" },
  },
}

M.bufferline = {
  n = {
    ["<leader>1"] = { "<cmd>lua require('bufferline').go_to(1, true)<cr>", "Go to buffer 1" },
    ["<leader>2"] = { "<cmd>lua require('bufferline').go_to(2, true)<cr>", "Go to buffer 2" },
    ["<leader>3"] = { "<cmd>lua require('bufferline').go_to(3, true)<cr>", "Go to buffer 3" },
    ["<leader>4"] = { "<cmd>lua require('bufferline').go_to(4, true)<cr>", "Go to buffer 4" },
    ["<leader>5"] = { "<cmd>lua require('bufferline').go_to(5, true)<cr>", "Go to buffer 5" },
    ["<leader>6"] = { "<cmd>lua require('bufferline').go_to(6, true)<cr>", "Go to buffer 6" },
    ["<leader>7"] = { "<cmd>lua require('bufferline').go_to(7, true)<cr>", "Go to buffer 7" },
    ["<leader>8"] = { "<cmd>lua require('bufferline').go_to(8, true)<cr>", "Go to buffer 8" },
    ["<leader>9"] = { "<cmd>lua require('bufferline').go_to(9, true)<cr>", "Go to buffer 9" },
    ["<leader>0"] = { "<cmd>lua require('bufferline').go_to(-1, true)<cr>", "Go to last buffer" },
    -- cycle through buffers
    ["<tab>"] = {
      "<cmd>BufferLineCycleNext<CR>",
      "Goto next buffer",
    },

    ["<S-tab>"] = {
      "<cmd>BufferLineCyclePrev<CR>",
      "Goto prev buffer",
    },

    -- close buffer + hide terminal buffer
    ["<leader>x"] = {
      function()
        local bufferToDelete = vim.api.nvim_get_current_buf()
        require("bufferline").cycle(-1)
        vim.cmd("bdelete! " .. bufferToDelete)
      end,
      "Close buffer",
    },
  },
}

return M
