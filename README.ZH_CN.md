# 📝 Hanasa 的个人neovim配置文件
[![GitHub](https://img.shields.io/github/license/hanasa2023/neovim-dotfile?style=for-the-badge)](https://github.com/hanasa2023/neovim-dotfile?tab=MIT-1-ov-file)
#### 这是一个基于 [NvChad](https://nvchad.com) 的客制化neovim
![Dashboard](https://files.catbox.moe/bhwb6z.png)

## 📸 屏幕快照
![UI](https://files.catbox.moe/8bgfkk.png)

- 所有键位绑定都可以在 `lua/mappings.lua` 中找到。并且你可以在 `CheatSheet` 中找到所有的键位绑定。
![CheatSheet](https://files.catbox.moe/mpnlxn.png)

## ✨ 特性
- 使用基于 vscode 状态栏的自定义 lualine 主题。你可以在 [hanasa2023\vscode-lualine](https://github.com/hanasa2023/vscode-lualine.git) 找到它。
![vscode-lualine](https://files.catbox.moe/wbht81.png)

### 为什么使用 lualine?
因为插件 'wilder.nvim' 与 NvChad 提供的默认状态栏有冲突。

## ⚡️ 安装需求
- Neovim 0.10.0+

## 📦 安装
### Linux / MacOs(Unix)
```
git clone https://github.com/hanasa2023/neovim-dotfile ~/.config/nvim
```
### Windows
- 如果你正在使用 Command Prompt(CMD)
```
git clone https://github.com/hanasa2023/neovim-dotfile %USERPROFILE%\AppData\Local\nvim --depth 1 && nvim
```
- 如果你正在使用 PowerShell(pwsh)
```
git clone https://github.com/hanasa2023/neovim-dotfile $ENV:USERPROFILE\AppData\Local\nvim --depth 1 && nvim
```
**如果上面的路径对你无效，你可以尝试以下路径:**
- 使用CMD : %LOCALAPPDATA%\nvim-lua
```
C:\Users\%USERNAME%\AppData\Local\nvim
```
- 使用 PowerShell : $ENV:LocalAppData\nvim
```
C:\Users\$ENV:USERNAME\AppData\Local\nvim
```

## 🚚 卸载
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

## 🚀 插件
### 📌 NvChad 默认插件
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

### ➕ 客制化插件
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
