# 📝 Hanasa's personal neovim dotfiles
[![GitHub](https://img.shields.io/github/license/hanasa2023/neovim-dotfile?style=for-the-badge)](https://github.com/hanasa2023/neovim-dotfile?tab=MIT-1-ov-file)
#### This is a customized neovim based by [NvChad](https://nvchad.com)
![Dashboard](https://files.catbox.moe/bhwb6z.png)

## 📸 ScreenShot
![UI](https://files.catbox.moe/8bgfkk.png)

- All of the keybindings are in the `lua/mappings.lua` file.And you can find all keybindings in the `CheatSheet`
![CheatSheet](https://files.catbox.moe/mpnlxn.png)

## ✨ Features
- Using a customized lualine theme based by vscode statusline.You can found it on [hanasa2023\vscode-lualine](https://github.com/hanasa2023/vscode-lualine)
![vscode-lualine](https://files.catbox.moe/wbht81.png)

### Why using lualine?
Because the plugin 'wilder.nvim' has a conflict with the default statusline provided by NvChad.

## ⚡️ Requirements
- Neovim 0.10.0+

## 📦 Installation
### Linux / MacOs(Unix)
```
git clone https://github.com/hanasa2023/neovim-dotfile ~/.config/nvim
```
### Windows
- If you're using Command Prompt(CMD)
```
git clone https://github.com/hanasa2023/neovim-dotfile %USERPROFILE%\AppData\Local\nvim --depth 1 && nvim
```
- If you're using PowerShell(pwsh)
```
git clone https://github.com/hanasa2023/neovim-dotfile $ENV:USERPROFILE\AppData\Local\nvim --depth 1 && nvim
```
**If the above path doesnt work, try any of these paths :**
- For CMD : %LOCALAPPDATA%\nvim-lua
```
C:\Users\%USERNAME%\AppData\Local\nvim
```
- For PowerShell : $ENV:LocalAppData\nvim
```
C:\Users\$ENV:USERNAME\AppData\Local\nvim
```

## 🚚 Uninstall
### Linux / MacOs(Unix)
```
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
```

### Windows CMD
```
rd -r ~\AppData\Local\nvim
rd -r ~\AppData\Local\nvim-data
```

### Window PowerShell
```
rm -Force ~\AppData\Local\nvim
rm -Force ~\AppData\Local\nvim-data

```

## 🚀 Plugins
### 📌 NvChad default plugins
<hr>

- [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
- [NvChad/base46](https://github.com/NvChad/base46)
- [NvChad/ui](https://github.com/NvChad/ui)
- [NvChad/nvterm](https://github.com/NvChad/nvterm)
- [NvChad/nvim-colorizer.lua](https://github.com/NvChad/nvim-colorizer.lua)
- [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
- [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)
- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- cmp sources plugins
  > [saadparwaiz1/cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)<br>
  > [hrsh7th/cmp-nvim-lua](https://github.com/hrsh7th/cmp-nvim-lua)<br>
  > [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)<br>
  > [hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer)<br>
  > [hrsh7th/cmp-path](https://github.com/hrsh7th/cmp-path)<br>
- [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim)
- [nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)
- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [folke/which-key.nvim](https://github.com/folke/which-key.nvim)
- [max397574/better-escape.nvim](https://github.com/max397574/better-escape.nvim)
- [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim)

### ➕ Customized plugins
<hr>
    
- [rcarriga/nvim-notify](https://github.com/rcarriga/nvim-notify)
- [Bekaboo/dropbar.nvim](https://github.com/Bekaboo/dropbar.nvim)
- [gelguy/wilder.nvim](https://github.com/gelguy/wilder.nvim)
- [linux-cultist/venv-selector.nvim](https://github.com/linux-cultist/venv-selector.nvim)
- [Eandrju/cellular-automaton.nvim](https://github.com/Eandrju/cellular-automaton.nvim)
- [github/copilot.vim](https://github.com/github/copilot.vim)
- [kdheepak/lazygit.nvim](https://github.com/kdheepak/lazygit.nvim)
- [theniceboy/joshuto.nvim](https://github.com/theniceboy/joshuto.nvim)
- [petertriho/nvim-scrollbar](https://github.com/petertriho/nvim-scrollbar)
- [kylechui/nvim-surround](https://github.com/kylechui/nvim-surround)
- [iamcco/markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)
- [shellRaining/hlchunk.nvim](https://github.com/shellRaining/hlchunk.nvim)
- [folke/todo-comments.nvim](https://github.com/folke/todo-comments.nvim)
- [folke/trouble.nvim](https://github.com/folke/trouble.nvim)
- [windwp/nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)
- [xiyaowong/transparent.nvim](https://github.com/xiyaowong/transparent.nvim)
- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- [nvim-neo-tree/neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)
- [akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
