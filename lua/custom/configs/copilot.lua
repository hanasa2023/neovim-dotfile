vim.g.copilot_enabled = true
vim.g.copilot_no_tab_map = true
vim.keymap.set("i", "<c-c>", 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false,
})
vim.cmd [[
  		let g:copilot_filetypes = {
         \ 'TelescopePrompt': v:false,
       \ }
  		]]
