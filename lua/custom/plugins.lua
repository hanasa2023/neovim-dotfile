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
      require "custom.configs.nvim-notify"
    end,
  },

  {
    "Bekaboo/dropbar.nvim",
    commit = "19011d96959cd40a7173485ee54202589760caae",
    lazy = false,
    config = function()
      require "custom.configs.dropbar"
    end,
  },

  {
    "gelguy/wilder.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    config = function()
      require "custom.configs.wilder"
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
    keys = {},
  },

  {
    "Eandrju/cellular-automaton.nvim",
    lazy = false,
  },

  {
    "github/copilot.vim",
    lazy = false,
    config = function()
      vim.g.copilot_enabled = true
      vim.g.copilot_no_tab_map = true
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
    dependencies = { "akinsho/toggleterm.nvim" },
    config = function()
      require "custom.configs.lazygit"
    end,
  },

  {
    "theniceboy/joshuto.nvim",
    lazy = false,
    cmd = "Joshuto",
    config = function()
      -- let g:joshuto_use_neovim_remote = 1 " for neovim-remote support
      vim.g.joshuto_floating_window_scaling_factor = 1.0
      vim.g.joshuto_use_neovim_remote = 1
      vim.g.joshuto_floating_window_winblend = 0
    end,
  },

  {
    "petertriho/nvim-scrollbar",
    lazy = false,
    dependencies = {
      "kevinhwang91/nvim-hlslens",
    },
    config = function()
      require "custom.configs.nvim-scrollbar"
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
      require "custom.configs.hlchunk"
    end,
  },

  {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = function()
      require "custom.configs.todo-comments"
    end,
  },

  {
    "folke/trouble.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function()
      require "custom.configs.trouble"
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    lazy = false,
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require "custom.configs.nvim-ts-autotag"
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
      require "custom.configs.lualine.vscode_dark"
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
