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
wilder.set_option(
  "renderer",
  wilder.popupmenu_renderer(wilder.popupmenu_border_theme {
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
  })
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
-- default config
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
