-- local Terminal = require("toggleterm.terminal").Terminal
-- local lazygit = Terminal:new {
--   cmd = "lazygit",
--   hidden = true,
--   direction = "float",
--   float_opts = {
--     border = "curved",
--   },
-- }

-- function _lazygit_toggle()
--   lazygit:toggle()
-- end

vim.g.lazygit_floating_window_scaling_factor = 1.0
vim.g.lazygit_floating_window_winblend = 0
vim.g.lazygit_use_neovim_remote = true
-- vim.keymap.set("n", "<c-g>", ":LazyGit<CR>", { noremap = true, silent = true })
--[[ vim.keymap.set("n", "<c-g>", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })]]
