--type conform.options
local options = {
  lsp_fallback = true,

  formatters_by_ft = {
    lua = { "stylua" },

    javascript = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    vue = { "prettier" },
    python = { "ast-grep" },

    sh = { "shfmt" },

    -- kotlin = { "ktlint" },
  },

  -- formatters = {
  --   kotlin = {
  --     command = "ktlint",
  --     pretend_args = {
  --       "--stdin --format",
  --     },
  --     timeout_ms = 5000,
  --   },
  -- },

  -- adding same formatter for multiple filetypes can look too much work for some
  -- instead of the above code you could just use a loop! the config is just a table after all!

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 5000,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
