local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "stevearc/conform.nvim",
    --  for users those who want auto-save conform + lazyloading!
    -- event = "BufWritePre"
    config = function()
      require "custom.configs.conform"
    end,
  },

  {
    "rcarriga/nvim-notify",
    lazy = false,
    config = function()
      local notify = require "notify"
      vim.notify = notify
      notify.setup {
        on_open = function(win)
          vim.api.nvim_win_set_config(win, { border = "rounded" })
        end,
        background_colour = "#202020",
        fps = 60,
        level = 2,
        minimum_width = 50,
        render = "compact",
        stages = "fade_in_slide_out",
        timeout = 3000,
        top_down = true,
      }
      local opts = { noremap = true, silent = true }
      -- vim.keymap.set("n", ",;", function()
      --   require("telescope").extensions.notify.notify {
      --     layout_strategy = "vertical",
      --     layout_config = {
      --       width = 0.9,
      --       height = 0.9,
      --       -- preview_height = 0.1,
      --     },
      --     wrap_results = true,
      --     previewer = false,
      --   }
      -- end, opts)
      vim.keymap.set("n", "<LEADER>c;", notify.dismiss, opts)
    end,
  },

  {
    "Bekaboo/dropbar.nvim",
    commit = "19011d96959cd40a7173485ee54202589760caae",
    lazy = false,
    config = function()
      local api = require "dropbar.api"
      vim.keymap.set("n", "<Leader>;", api.pick)
      vim.keymap.set("n", "[c", api.goto_context_start)
      vim.keymap.set("n", "]c", api.select_next_context)

      local confirm = function()
        local menu = api.get_current_dropbar_menu()
        if not menu then
          return
        end
        local cursor = vim.api.nvim_win_get_cursor(menu.win)
        local component = menu.entries[cursor[1]]:first_clickable(cursor[2])
        if component then
          menu:click_on(component)
        end
      end

      local quit_curr = function()
        local menu = api.get_current_dropbar_menu()
        if menu then
          menu:close()
        end
      end

      require("dropbar").setup {
        menu = {
          -- When on, automatically set the cursor to the closest previous/next
          -- clickable component in the direction of cursor movement on CursorMoved
          quick_navigation = true,
          ---@type table<string, string|function|table<string, string|function>>
          keymaps = {
            ["<LeftMouse>"] = function()
              local menu = api.get_current_dropbar_menu()
              if not menu then
                return
              end
              local mouse = vim.fn.getmousepos()
              if mouse.winid ~= menu.win then
                local parent_menu = api.get_dropbar_menu(mouse.winid)
                if parent_menu and parent_menu.sub_menu then
                  parent_menu.sub_menu:close()
                end
                if vim.api.nvim_win_is_valid(mouse.winid) then
                  vim.api.nvim_set_current_win(mouse.winid)
                end
                return
              end
              menu:click_at({ mouse.line, mouse.column }, nil, 1, "l")
            end,
            ["<CR>"] = confirm,
            ["i"] = confirm,
            ["<esc>"] = quit_curr,
            ["q"] = quit_curr,
            ["n"] = quit_curr,
            ["<MouseMove>"] = function()
              local menu = api.get_current_dropbar_menu()
              if not menu then
                return
              end
              local mouse = vim.fn.getmousepos()
              if mouse.winid ~= menu.win then
                return
              end
              menu:update_hover_hl { mouse.line, mouse.column - 1 }
            end,
          },
        },
      }
    end,
  },

  {
    "gelguy/wilder.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    config = function()
      local wilder = require "wilder"
      local gradient = {
        "#f4468f",
        "#fd4a85",
        "#ff507a",
        "#ff566f",
        "#ff5e63",
        "#ff6658",
        "#ff704e",
        "#ff7a45",
        "#ff843d",
        "#ff9036",
        "#f89b31",
        "#efa72f",
        "#e6b32e",
        "#dcbe30",
        "#d2c934",
        "#c8d43a",
        "#bfde43",
        "#b6e84e",
        "#aff05b",
      }

      for i, fg in ipairs(gradient) do
        gradient[i] = wilder.make_hl("WilderGradient" .. i, "Pmenu", { { a = 1 }, { a = 1 }, { foreground = fg } })
      end
      wilder.setup {
        modes = { ":" },
        next_key = "<Tab>",
        previous_key = "<S-Tab>",
      }
      -- wilder.set_option(
      --   "renderer",
      --   wilder.popupmenu_renderer(wilder.popupmenu_palette_theme {
      --     pumblend = 0,
      --     highlights = {
      --       border = "Normal", -- highlight to use for the border
      --       gradient = gradient,
      --     },
      --     highlighter = wilder.highlighter_with_gradient({
      --       wilder.basic_highlighter(),
      --     }),
      --     left = { " ", wilder.popupmenu_devicons() },
      --     right = { " ", wilder.popupmenu_scrollbar() },
      --     border = "rounded",
      --     max_height = "75%", -- max height of the palette
      --     min_height = 0, -- set to the same as 'max_height' for a fixed height window
      --     prompt_position = "top", -- 'top' or 'bottom' to set the location of the prompt
      --     reverse = 0, -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'
      --   })
      -- )
      wilder.set_option(
        "renderer",
        wilder.popupmenu_renderer(
          -- pumblend = 0,
          -- highlights = {
          --   gradient = gradient,
          -- },
          -- highlighter = wilder.highlighter_with_gradient {
          --   wilder.basic_highlighter(),
          -- },
          -- left = { " ", wilder.popupmenu_devicons() },
          -- right = { " ", wilder.popupmenu_scrollbar() },
          wilder.popupmenu_border_theme {
            pumblend = 0,
            highlights = {
              border = "Normal",
              gradient = gradient,
            },
            border = "double",
            highlighter = wilder.highlighter_with_gradient {
              wilder.basic_highlighter(),
            },
            left = { " ", wilder.popupmenu_devicons() },
            right = { " ", wilder.popupmenu_scrollbar() },
          }
        )
      )
      wilder.set_option("pipeline", {
        wilder.branch(
          wilder.cmdline_pipeline {
            language = "vim",
            fuzzy = 1,
          },
          wilder.search_pipeline()
        ),
      })
    end,
  },

  {
    "linux-cultist/venv-selector.nvim",
    dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
    config = function()
      require("venv-selector").setup {
        -- Your options go here
        -- name = "venv",
        -- auto_refresh = false
        anaconda_base_path = "/opt/miniconda3",
        anaconda_envs_path = "/home/hanasa/miniconda3",
      }
    end,
    event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
    keys = {
      -- Keymap to open VenvSelector to pick a venv.
      -- { "<leader>vs", "<cmd>VenvSelect<cr>" },
      -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
      -- { "<leader>vc", "<cmd>VenvSelectCached<cr>" },
    },
  },

  {
    "Eandrju/cellular-automaton.nvim",
    lazy = false,
    -- keys = "<leader>rr",
    -- config = function()
    --   vim.keymap.set("n", "<leader>rr", "<cmd>CellularAutomaton make_it_rain<CR>")
    -- end,
  },

  {
    "github/copilot.vim",
    lazy = false,
    config = function()
      vim.g.copilot_enabled = true
      vim.g.copilot_no_tab_map = true
      -- vim.api.nvim_set_keymap('n', '<leader>go', ':Copilot<CR>', { silent = true })
      -- vim.api.nvim_set_keymap('n', '<leader>ge', ':Copilot enable<CR>', { silent = true })
      -- vim.api.nvim_set_keymap('n', '<leader>gd', ':Copilot disable<CR>', { silent = true })
      -- vim.api.nvim_set_keymap('i', '<c-p>', '<Plug>(copilot-suggest)', { noremap = true })
      -- vim.api.nvim_set_keymap('i', '<c-n>', '<Plug>(copilot-next)', { noremap = true, silent = true })
      -- vim.api.nvim_set_keymap('i', '<c-l>', '<Plug>(copilot-previous)', { noremap = true, silent = true })
      vim.cmd 'imap <silent><script><expr> <C-C> copilot#Accept("")'
      vim.cmd [[
  		let g:copilot_filetypes = {
         \ 'TelescopePrompt': v:false,
       \ }
  		]]
    end,
  },

  {
    "kdheepak/lazygit.nvim",
    lazy = false,
    -- keys = { "<c-g>" },
    dependencies = { "akinsho/toggleterm.nvim" },
    config = function()
      local Terminal = require("toggleterm.terminal").Terminal
      local lazygit = Terminal:new {
        cmd = "lazygit",
        hidden = true,
        direction = "float",
        float_opts = {
          border = "curved",
        },
      }

      -- function _lazygit_toggle()
      --   lazygit:toggle()
      -- end

      vim.g.lazygit_floating_window_scaling_factor = 1.0
      vim.g.lazygit_floating_window_winblend = 0
      vim.g.lazygit_use_neovim_remote = true
      -- vim.keymap.set("n", "<c-g>", ":LazyGit<CR>", { noremap = true, silent = true })
      --[[ vim.keymap.set("n", "<c-g>", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })]]
    end,
  },

  {
    "theniceboy/joshuto.nvim",
    lazy = false,
    cmd = "Joshuto",
    config = function()
      -- let g:joshuto_floating_window_winblend = 0
      -- let g:joshuto_floating_window_scaling_factor = 1.0
      -- let g:joshuto_use_neovim_remote = 1 " for neovim-remote support
      vim.g.joshuto_floating_window_scaling_factor = 1.0
      vim.g.joshuto_use_neovim_remote = 1
      vim.g.joshuto_floating_window_winblend = 0
      -- vim.keymap.set("n", "<c-t>", ":Joshuto")
    end,
  },

  {
    "petertriho/nvim-scrollbar",
    lazy = false,
    dependencies = {
      "kevinhwang91/nvim-hlslens",
    },
    config = function()
      local group = vim.api.nvim_create_augroup("scrollbar_set_git_colors", {})
      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "*",
        callback = function()
          vim.cmd [[
hi! ScrollbarGitAdd guifg=#8CC85F
hi! ScrollbarGitAddHandle guifg=#A0CF5D
hi! ScrollbarGitChange guifg=#E6B450
hi! ScrollbarGitChangeHandle guifg=#F0C454
hi! ScrollbarGitDelete guifg=#F87070
hi! ScrollbarGitDeleteHandle guifg=#FF7B7B ]]
        end,
        group = group,
      })
      require("scrollbar.handlers.search").setup {}
      require("scrollbar.handlers.gitsigns").setup()
      require("scrollbar.handlers.cursor").setup()
      require("scrollbar").setup {
        show = true,
        handle = {
          text = " ",
          color = "#928374",
          hide_if_all_visible = true,
        },
        marks = {
          Search = { color = "yellow" },
          Misc = { color = "purple" },
        },
        handlers = {
          cursor = false,
          diagnostic = true,
          gitsigns = true,
          handle = true,
          search = true,
        },
      }
    end,
  },

  {
    "kylechui/nvim-surround",
    lazy = false,
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {}
    end,
  },

  {
    "iamcco/markdown-preview.nvim",
    lazy = false,
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  {
    "shellRaining/hlchunk.nvim",
    init = function()
      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, { pattern = "*", command = "EnableHL" })
      require("hlchunk").setup {
        chunk = {
          enable = true,
          exclude_filetypes = {
            dashboard = false,
          },
          use_treesitter = true,
          style = {
            { fg = "#806d9c" },
          },
        },
        indent = {
          chars = { "│", "¦", "┆", "┊" },
          use_treesitter = true,
        },
        blank = {
          enable = false,
          use_treesitter = true,
          exclude_filetypes = {
            dashboard = false,
          },
        },
        line_num = {
          use_treesitter = true,
        },
      }
    end,
  },

  {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },

  {
    "folke/trouble.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },

  {
    "windwp/nvim-ts-autotag",
    lazy = false,
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-ts-autotag").setup {
        -- your config
        enable = true,
        filetypes = {
          "html",
          "javascript",
          "typescript",
          "vue",
          "tsx",
          "jsx",
          "xml",
          "markdown",
        },
      }
    end,
  },

  {
    "xiyaowong/transparent.nvim",
    lazy = false,
  },

  {
    "nvim-lualine/lualine.nvim",
    -- You can optionally lazy-load heirline on UiEnter
    -- to make sure all required plugins and colorschemes are loaded before setup
    event = "UIEnter",
    config = function()
      require("lualine").setup {
        options = {
          icons_enabled = true,
          theme = "auto",
          -- theme = "catppuccin",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          -- section_separators = { left = '', right = '' },
          -- component_separators = { left = '', right = '' },

          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = true,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          },
        },
        sections = {
          lualine_a = { "filename" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = {},
          lualine_x = {},
          lualine_y = { "filesize", "fileformat", "filetype" },
          lualine_z = { "location" },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = { "quickfix" },
      }
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
