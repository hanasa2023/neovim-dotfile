local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

    -- Override plugin definition options

    -- {
    --   "neovim/nvim-lspconfig",
    --   config = function()
    --     require "plugins.configs.lspconfig"
    --     require "custom.configs.lspconfig"
    --   end, -- Override to setup mason-lspconfig
    -- },

    -- override plugin configs
    {
        "williamboman/mason.nvim",
        opts = overrides.mason,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = { "stevearc/dressing.nvim" },
        opts = overrides.treesitter,
    },

    -- {
    --   "nvim-tree/nvim-tree.lua",
    --   opts = overrides.nvimtree,
    -- },

    {
        "nvim-neo-tree/neo-tree.nvim",
        lazy = false,
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            "3rd/image.nvim",              -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        config = function()
            require "custom.configs.neotree"
        end,
    },

    -- Install a plugin
    {
        "max397574/better-escape.nvim",
        event = "InsertEnter",
        config = function()
            require("better_escape").setup()
        end,
    },

    -- {
    --   "stevearc/conform.nvim",
    --   --  for users those who want auto-save conform + lazyloading!
    --   -- event = "BufWritePre"
    --   config = function()
    --     require "custom.configs.conform"
    --   end,
    -- },

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
            require "custom.configs.copilot"
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
        config = function()
            require "custom.configs.transparent"
        end,
    },

    {
        "nvim-lualine/lualine.nvim",
        -- You can optionally lazy-load heirline on UiEnter
        -- to make sure all required plugins and colorschemes are loaded before setup
        event = "UIEnter",
        config = function()
            require "custom.configs.lualine.vscode_transparent_dark_bg"
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter-context",
        lazy = false,
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("treesitter-context").setup()
        end,
    },

    {
        "akinsho/bufferline.nvim",
        lazy = false,
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require "custom.configs.bufferline"
        end,
    },

    {
        "neoclide/coc.nvim",
        lazy = false,
        branch = "release",
        config = function()
            require "custom.configs.coc"
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

    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {
            fast_wrap = {},
            map_cr = false,
            disable_filetype = { "TelescopePrompt", "vim" },
        },
        config = true,
        --   function(_, opts)
        --   require("nvim-autopairs").setup(opts)
        --
        --   -- setup cmp for autopairs
        --   local cmp_autopairs = require "nvim-autopairs.completion.cmp"
        --   require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        -- end,
    },
    {
        "RRethy/vim-illuminate",
        lazy = false,
    },
    {
        "CRAG666/code_runner.nvim",
        lazy = false,
        config = function()
            require("custom.configs.code-runner")
        end
    },
}

return plugins
