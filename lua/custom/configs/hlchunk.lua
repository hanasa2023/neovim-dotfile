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
