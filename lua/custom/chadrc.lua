---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "catppuccin",
  theme_toggle = { "catppuccin", "one_light" },
  transparency = true,

  hl_override = highlights.override,
  hl_add = highlights.add,
  statusline = {
    theme = "vscode_colored",
  },
  tabufline = {
    show_numbers = false,
    enabled = false,
    lazyload = true,
    overriden_modules = nil,
  },
  nvdash = {
    load_on_startup = true,

    header = {

      --"██╗  ██╗ █████╗ ███╗   ██╗ █████╗ ███████╗ █████╗ ",
      --"██║  ██║██╔══██╗████╗  ██║██╔══██╗██╔════╝██╔══██╗",
      --"███████║███████║██╔██╗ ██║███████║███████╗███████║",
      --"██╔══██║██╔══██║██║╚██╗██║██╔══██║╚════██║██╔══██║",
      --"██║  ██║██║  ██║██║ ╚████║██║  ██║███████║██║  ██║",
      --"╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝",

      "██╗  ██╗ █████╗ ███╗   ██╗ █████╗ ███████╗ █████╗ ██╗  ██╗██╗",
      "██║  ██║██╔══██╗████╗  ██║██╔══██╗██╔════╝██╔══██╗██║ ██╔╝██║",
      "███████║███████║██╔██╗ ██║███████║███████╗███████║█████╔╝ ██║",
      "██╔══██║██╔══██║██║╚██╗██║██╔══██║╚════██║██╔══██║██╔═██╗ ██║",
      "██║  ██║██║  ██║██║ ╚████║██║  ██║███████║██║  ██║██║  ██╗██║",
      "╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝",
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
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
