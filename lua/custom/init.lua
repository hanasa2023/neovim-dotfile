local usercmd = vim.api.nvim_create_user_command

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
--
-- function DelCurrentBuf()
--   local buf = vim.api.nvim_get_current_buf()
--   vim.api.nvim_command("echo" .. buf)
--   vim.api.nvim_buf_delete(buf, { force = true })
-- end

usercmd("HandleURL", function()
  local line = vim.api.nvim_get_current_line()
  local url = string.match(line, "[a-z]*://[^ >,;\"']*")
  if url ~= nil then
    -- vim.api.nvim_command(':terminal vivaldi "' .. url .. '"')
    -- vim.api.nvim_command(':terminal nohup google-chrome-stable "' .. url .. '"')
    require("nvterm.terminal").send('vivaldi "' .. url .. '"', "horizontal")
  else
    vim.api.nvim_command 'echo "No URI found in line."'
  end
end, { nargs = 0 })

-- vim.api.nvim_set_keymap("n", "gf", [[ <Cmd>lua M.HandleURL()<CR> ]], {})- })
-- "https://www.google.com
