require("bufferline").setup {
  options = {
    mode = "buffers",
    numbers = "ordinal",
    indicator = {
      icon = "▎",
      style = "none",
    },
    buffer_close_icon = "󰅖",
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = true,
    diagnostics_indicator = function(count, level)
      local icon = level:match "error" and " " or " "
      return " " .. icon .. count
    end,
    offsets = {
      {
        filetype = "neo-tree",
        text = "󰄛 Hanasaki",
        text_align = "center",
        separator = true,
      },
    },
    color_icons = true,
    show_buffer_icons = true,
    show_close_icon = true,
    separator_style = "thin",
    always_show_bufferline = false,
    sort_by = "id",
  },
}
