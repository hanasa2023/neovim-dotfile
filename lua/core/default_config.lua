local M = {}

M.options = {
  nvchad_branch = "v2.0",
}

M.ui = {
  ------------------------------- base46 -------------------------------------
  -- hl = highlights
  hl_add = {},
  hl_override = {},
  changed_themes = {},
  theme_toggle = { "onedark", "one_light" },
  theme = "onedark", -- default theme
  transparency = false,
  lsp_semantic_tokens = false, -- needs nvim v0.9, just adds highlight groups for lsp semantic tokens

  -- https://github.com/NvChad/base46/tree/v2.0/lua/base46/extended_integrations
  extended_integrations = {}, -- these aren't compiled by default, ex: "alpha", "notify"

  -- cmp themeing
  cmp = {
    icons = true,
    lspkind_text = true,
    style = "atom_colored", -- default/flat_light/flat_dark/atom/atom_colored
    border_color = "grey_fg", -- only applicable for "default" style, use color names from base30 variables
    selected_item_bg = "colored", -- colored / simple
  },

  telescope = { style = "bordered" }, -- borderless / bordered

  ------------------------------- nvchad_ui modules -----------------------------
  statusline = {
    theme = "default", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "default",
    overriden_modules = nil,
  },

  -- lazyload it when there are 1+ buffers
  tabufline = {
    show_numbers = false,
    enabled = true,
    lazyload = true,
    overriden_modules = nil,
  },

  -- nvdash (dashboard)
  nvdash = {
    load_on_startup = true,

    header = {
      -- "           ▄ ▄                   ",
      -- "       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
      -- "       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
      -- "    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ",
      -- "  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
      -- "  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
      -- "▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
      -- "█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
      -- "    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",
      --
      -- ' ⣇⣿⠘⣿⣿⣿⡿⡿⣟⣟⢟⢟⢝⠵⡝⣿⡿⢂⣼⣿⣷⣌⠩⡫⡻⣝⠹⢿⣿⣷ ',
      -- ' ⡆⣿⣆⠱⣝⡵⣝⢅⠙⣿⢕⢕⢕⢕⢝⣥⢒⠅⣿⣿⣿⡿⣳⣌⠪⡪⣡⢑⢝⣇ ',
      -- ' ⡆⣿⣿⣦⠹⣳⣳⣕⢅⠈⢗⢕⢕⢕⢕⢕⢈⢆⠟⠋⠉⠁⠉⠉⠁⠈⠼⢐⢕⢽ ',
      -- ' ⡗⢰⣶⣶⣦⣝⢝⢕⢕⠅⡆⢕⢕⢕⢕⢕⣴⠏⣠⡶⠛⡉⡉⡛⢶⣦⡀⠐⣕⢕ ',
      -- ' ⡝⡄⢻⢟⣿⣿⣷⣕⣕⣅⣿⣔⣕⣵⣵⣿⣿⢠⣿⢠⣮⡈⣌⠨⠅⠹⣷⡀⢱⢕ ',
      -- ' ⡝⡵⠟⠈⢀⣀⣀⡀⠉⢿⣿⣿⣿⣿⣿⣿⣿⣼⣿⢈⡋⠴⢿⡟⣡⡇⣿⡇⡀⢕ ',
      -- ' ⡝⠁⣠⣾⠟⡉⡉⡉⠻⣦⣻⣿⣿⣿⣿⣿⣿⣿⣿⣧⠸⣿⣦⣥⣿⡇⡿⣰⢗⢄ ',
      -- ' ⠁⢰⣿⡏⣴⣌⠈⣌⠡⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣬⣉⣉⣁⣄⢖⢕⢕⢕ ',
      -- ' ⡀⢻⣿⡇⢙⠁⠴⢿⡟⣡⡆⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣵⣵⣿ ',
      -- ' ⡻⣄⣻⣿⣌⠘⢿⣷⣥⣿⠇⣿⣿⣿⣿⣿⣿⠛⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ',
      -- ' ⣷⢄⠻⣿⣟⠿⠦⠍⠉⣡⣾⣿⣿⣿⣿⣿⣿⢸⣿⣦⠙⣿⣿⣿⣿⣿⣿⣿⣿⠟ ',
      -- ' ⡕⡑⣑⣈⣻⢗⢟⢞⢝⣻⣿⣿⣿⣿⣿⣿⣿⠸⣿⠿⠃⣿⣿⣿⣿⣿⣿⡿⠁⣠ ',
      -- ' ⡝⡵⡈⢟⢕⢕⢕⢕⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⠿⠋⣀⣈⠙ ',
      -- ' ⡝⡵⡕⡀⠑⠳⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⢉⡠⡲⡫⡪⡪⡣ ',
      --
      -- "        ,--,                                                             ",
      -- "      ,--.'|                                                             ",
      -- "   ,--,  | :                                                             ",
      -- ",---.'|  : '                  ,---,                                      ",
      -- "|   | : _' |              ,-+-. /  |              .--.--.                ",
      -- ":   : |.'  |  ,--.--.    ,--.'|'   |  ,--.--.    /  /    '    ,--.--.    ",
      -- "|   ' '  ; : /       \\  |   |  ,\"' | /       \\  |  :  /`./   /       \\   ",
      -- "'   |  .'. |.--.  .-. | |   | /  | |.--.  .-. | |  :  ;_    .--.  .-. |  ",
      -- "|   | :  | ' \\__\\/: . . |   | |  | | \\__\\/: . .  \\  \\    `.  \\__\\/: . .  ",
      -- '\'   : |  : ; ," .--.; | |   | |  |/  ," .--.; |   `----.   \\ ," .--.; |  ',
      -- "|   | '  ,/ /  /  ,.  | |   | |--'  /  /  ,.  |  /  /`--'  //  /  ,.  |  ",
      -- ";   : ;--' ;  :   .'   \\|   |/     ;  :   .'   '--'.     /;  :   .'   \\ ",
      -- "|   ,/     |  ,     .-./'---'      |  ,     .-./  `--'---' |  ,     .-./ ",
      -- "'---'       `--`---'                `--`---'                `--`---'     ",

      "██╗  ██╗ █████╗ ███╗   ██╗ █████╗ ███████╗ █████╗ ",
      "██║  ██║██╔══██╗████╗  ██║██╔══██╗██╔════╝██╔══██╗",
      "███████║███████║██╔██╗ ██║███████║███████╗███████║",
      "██╔══██║██╔══██║██║╚██╗██║██╔══██║╚════██║██╔══██║",
      "██║  ██║██║  ██║██║ ╚████║██║  ██║███████║██║  ██║",
      "╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝",
      --
      -- "HHHHHHHHH     HHHHHHHHH                                                                                       ",
      -- "H:::::::H     H:::::::H                                                                                       ",
      -- "H:::::::H     H:::::::H                                                                                       ",
      -- "HH::::::H     H::::::HH                                                                                       ",
      -- "  H:::::H     H:::::H    aaaaaaaaaaaaa  nnnn  nnnnnnnn      aaaaaaaaaaaaa      ssssssssss     aaaaaaaaaaaaa   ",
      -- "  H:::::H     H:::::H    a::::::::::::a n:::nn::::::::nn    a::::::::::::a   ss::::::::::s    a::::::::::::a  ",
      -- "  H::::::HHHHH::::::H    aaaaaaaaa:::::an::::::::::::::nn   aaaaaaaaa:::::ass:::::::::::::s   aaaaaaaaa:::::a ",
      -- "  H:::::::::::::::::H             a::::ann:::::::::::::::n           a::::as::::::ssss:::::s           a::::a ",
      -- "  H:::::::::::::::::H      aaaaaaa:::::a  n:::::nnnn:::::n    aaaaaaa:::::a s:::::s  ssssss     aaaaaaa:::::a ",
      -- "  H::::::HHHHH::::::H    aa::::::::::::a  n::::n    n::::n  aa::::::::::::a   s::::::s        aa::::::::::::a ",
      -- "  H:::::H     H:::::H   a::::aaaa::::::a  n::::n    n::::n a::::aaaa::::::a      s::::::s    a::::aaaa::::::a ",
      -- "  H:::::H     H:::::H  a::::a    a:::::a  n::::n    n::::na::::a    a:::::assssss   s:::::s a::::a    a:::::a ",
      -- "HH::::::H     H::::::HHa::::a    a:::::a  n::::n    n::::na::::a    a:::::as:::::ssss::::::sa::::a    a:::::a ",
      -- "H:::::::H     H:::::::Ha:::::aaaa::::::a  n::::n    n::::na:::::aaaa::::::as::::::::::::::s a:::::aaaa::::::a ",
      -- "H:::::::H     H:::::::H a::::::::::aa:::a n::::n    n::::n a::::::::::aa:::as:::::::::::ss   a::::::::::aa:::a",
      -- "HHHHHHHHH     HHHHHHHHH  aaaaaaaaaa  aaaa nnnnnn    nnnnnn  aaaaaaaaaa  aaaa sssssssssss      aaaaaaaaaa  aaaa",
    },

    buttons = {
      { "  Find File", "Spc f f", "Telescope find_files" },
      { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
      { "  Bookmarks", "Spc m a", "Telescope marks" },
      { "  Themes", "Spc t h", "Telescope themes" },
      { "  Mappings", "Spc c h", "NvCheatsheet" },
    },
  },

  cheatsheet = { theme = "grid" }, -- simple/grid

  lsp = {
    -- show function signatures i.e args as you type
    signature = {
      disabled = false,
      silent = true, -- silences 'no signature help available' message from appearing
    },
  },
}

M.plugins = "" -- path i.e "custom.plugins", so make custom/plugins.lua file

M.lazy_nvim = require "plugins.configs.lazy_nvim" -- config for lazy.nvim startup options

M.mappings = require "core.mappings"

return M
