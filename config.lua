-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

local opt = vim.opt
local o = vim.o

--------------------------------- Color Scheme ---------------------------------

lvim.colorscheme = "lunar"

--------------------------------- Options ---------------------------------

opt.relativenumber = true
opt.termguicolors = true

o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
o.foldcolumn = "1" -- '0' is not bad
o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
o.foldlevelstart = 99
o.foldenable = true

-- lsp server
-- lvim.lsp.installer.setup.automatic_installation = false
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "tsserver", "volar" })
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
	return server ~= "vtsls"
end, lvim.lsp.automatic_configuration.skipped_servers)
vim.lsp.inlay_hint.enable(true)

--------------------------------- Mappings ---------------------------------

local n_map = lvim.keys.normal_mode
local i_map = lvim.keys.insert_mode

n_map["K"] = "5k"
n_map["J"] = "5j"
n_map["<S-q>"] = ":q<cr>"
n_map["<S-s>"] = ":w<cr>"
n_map["<s>"] = ":<nop>"
n_map["<C-n>"] = ":Neotree toggle<cr>"
n_map["<leader>gg"] = ":LazyGit<cr>"
n_map["<leader>t"] = ":ToggleTerm<cr>"
n_map["<leader><cr>"] = ":nohl<cr>"
n_map[";"] = ":"
i_map["jj"] = "<esc>"

-- refactoring

-- -- bufferline
-- for i = 1, 1, 9 do
--   lvim.keys.normal_mode[string.format("<leader>%s", i)] = function()
--     require("bufferline").go_to(i, true)
--   end
-- end
n_map["<leader>1"] = function()
	require("bufferline").go_to(1, true)
end
n_map["<leader>2"] = function()
	require("bufferline").go_to(2, true)
end
n_map["<leader>3"] = function()
	require("bufferline").go_to(3, true)
end
n_map["<leader>4"] = function()
	require("bufferline").go_to(4, true)
end
n_map["<leader>5"] = function()
	require("bufferline").go_to(5, true)
end
n_map["<leader>6"] = function()
	require("bufferline").go_to(6, true)
end
n_map["<leader>7"] = function()
	require("bufferline").go_to(7, true)
end
n_map["<leader>8"] = function()
	require("bufferline").go_to(8, true)
end
n_map["<leader>9"] = function()
	require("bufferline").go_to(9, true)
end
n_map["<leader>0"] = function()
	require("bufferline").go_to(-1, true)
end
n_map["<tab>"] = ":BufferLineCycleNext<cr>"
n_map["<S-tab>"] = ":BufferLineCyclePrev<cr>"
n_map["<leader>x"] = function()
	local bufferToDelete = vim.api.nvim_get_current_buf()
	require("bufferline").cycle(-1)
	vim.cmd("bdelete!" .. bufferToDelete)
end

--lsp mappings
lvim.lsp.buffer_mappings.normal_mode["K"] = nil
lvim.lsp.buffer_mappings.normal_mode["H"] = { vim.lsp.buf.hover, "Show documentation" }

-- which-key mappings
lvim.builtin.which_key.mappings["m"] = {
	":MarkdownPreview<cr>",
	"Open MarkdownPreview",
}
lvim.builtin.which_key.mappings["h"] = {
	":ToggleTerm size=16 direction=horizontal<cr>",
	"Open horizontal term",
}
lvim.builtin.which_key.mappings["f"] = {
	name = "file options",
	f = {
		function()
			require("lvim.core.telescope.custom-finders").find_project_files({ previewer = false })
		end,
		"Find File",
	},
	m = {
		function()
			require("conform").format()
		end,
		"Format file",
	},
	d = {
		function()
			local winid = require("ufo").peekFoldedLinesUnderCursor()
			if not winid then
				vim.lsp.buf.hover()
			end
		end,
		"Folded lines under cursor",
	},
}
lvim.builtin.which_key.mappings["e"] = {
	":Neotree focus<cr>",
	"Focus neotree",
}
lvim.builtin.which_key.mappings["r"] = {
	name = "refactoring",
	b = {
		function()
			require("refactoring").refactor("refactoring Extract Block")
		end,
		"Extract Block",
	},
	i = {
		function()
			require("refactoring").refactor("Inline Variable")
		end,
		"Inline Variable",
	},
	p = {
		function()
			require("refactoring").debug.printf({ below = false })
		end,
		"Debug: Print Function",
	},
	c = {
		function()
			require("refactoring").debug.clean_up()
		end,
		"Debug: Clean Up",
	},
	d = {
		function()
			require("refactoring").debug.print_var({ below = false })
		end,
		"Debug: Print Variable",
	},
	bf = {
		function()
			require("refactoring").refactor("Extract Block To File")
		end,
		"Extract Block To File",
	},
	f = {
		function()
			require("refactoring").refactor("Extract Function To File")
		end,
		"Extract Function To File",
	},
	v = {
		function()
			require("refactoring").refactor("Extract Variable")
		end,
		"Extract Variable",
	},
	e = {
		function()
			require("refactoring").refactor("Extract Function")
		end,
		"Extract Function",
	},
	r = {
		function()
			require("refactoring").select_refactor()
		end,
		"Select Refactor",
	},
}
lvim.builtin.which_key.mappings["T"] = {
	name = "neotest",
	t = {
		function()
			require("neotest").run.run()
		end,
		"Run test",
	},
	d = {
		function()
			require("neotest").run.run({ strategy = "dap" })
		end,
		"Debug test",
	},
	f = {
		function()
			require("neotest").run.run(vim.fn.expand("%"))
		end,
		"Run all tests in file",
	},
	p = {
		function()
			require("neotest").run.run(vim.fn.getcwd())
		end,
		"Run all test in project",
	},
	["<cr>"] = {
		function()
			require("neotest").summary.toggle()
		end,
		"Test summary",
	},
	o = {
		function()
			require("neotest").output.open()
		end,
		"Output hover",
	},
	O = {
		function()
			require("neotest").output_panel.toggle()
		end,
		"Output window",
	},
	n = {
		function()
			require("neotest").jump.next()
		end,
		"Next test",
	},
	N = {
		function()
			require("neotest").jump.prev()
		end,
		"Previous test",
	},
}
lvim.builtin.which_key.mappings["D"] = {
	name = "breakpoints",
	t = {
		function()
			require("dap").toggle_breakpoint()
		end,
		"Toggle breakpoint",
	},
	c = {
		function()
			require("dap").clear_breakpoints()
		end,
		"Clear all breakpoints",
	},
	s = {
		function()
			require("dap").set_breakpoint(vim.fn.input("[Condition] > "))
		end,
		"Set conditional breakpoint",
	},
}

----------------------------------------- Plugins ------------------------------------

lvim.builtin.nvimtree.active = false
lvim.builtin.breadcrumbs.active = false

-- dashboard
vim.api.nvim_set_hl(99, "Lisa", { bg = "none", fg = "#DD2200" })
vim.api.nvim_set_hl(99, "Ykn", { bg = "none", fg = "#881188" })
-- vim.api.nvim_set_hl(99, "Ykn", { bg = "none", fg = "#FFCC11" })
vim.api.nvim_set_hl(99, "Rose1", { bg = "none", fg = "#3344AA" })
vim.api.nvim_set_hl(99, "Rose2", { bg = "none", fg = "#DDDDFF" })
vim.api.nvim_set_hl_ns(99)
lvim.builtin.alpha.dashboard.section.header.opts.hl = "Lisa"
lvim.builtin.alpha.dashboard.section.header.val = {
	-- "OOOOOOOOOOOOOOOOdOOOOOdxOOOOOloOOOOkOOkclkOOOkKNdK",
	-- "OOOOOOkOOkkOOOOxkOOOOOdxOOOOkocxkOOdkkOxcokOO00NXk",
	-- "kkkkkdkkkkOOOOkdkkOOOkoxOOOOkookxkOkokkOxcokO0OkK0",
	-- "OkkkokkkdxOOOkxoxOOOOxox00OkxokNkdkkxoxkkdcdkOOkxx",
	-- "kkkdkkxookkOkxldkOOOkxlxOOOkxoXNN0dxkdlxkkdcxkOkxx",
	-- "xxdxxxd:xxkxolcdkOOkxdcdOOOxdlkkkOkooolcodolddkOxd",
	-- "xxoxoo:codollxlloxkddolxOOkdoXNWWWNN0ool:odlldxOkd",
	-- "dcoodl:oddolOKodOkdod0lxOOdoONWWWWNNNNOl;:oolodOkd",
	-- "dcxdd:ldocxXNkokxdoONkokOxoxNNWWWWNXKKXNOl;llcokOd",
	-- "o:do:;cco0KK0lddokXNNoxOxokNNNNKKKkolllldOo;;;oxkd",
	-- "l:c'';;::;:c::cxKNNNkdkdd0NNNNXk:. ....''..:o;ldko",
	-- "c,;'..,,.......,xNN0oddONNNNNNl;xx,.....dOc..kcddc",
	-- ":c..,k0O0o......lXOld0NNNNNNNNKdkkd:;;,''NXl ,,loc",
	-- "cc 'KNkkkdl::::,xXOXNNNNNNNNNNW:cco;,occ'KM0.Kdccc",
	-- ";0:;MMl:cox,okd;kNNNNNNNNNNNNNWdoKKOOKKO;NMOXNx:;x",
	-- ":0NxKM0:0KKKKKKcNNNNNNNNNNNNNNWNdOXXXXK0kWWNNNk,ck",
	-- ":dNNNWWko0XXX0kNWNNNNNNNNNNNNNWWW0kkkkdKNXXXNNd;dk",
	-- ";cNNNNXNXkxkkONWWNNNNNNNNNNNNNNNNNNNNNXXXXXXNN:ckk",
	-- ":,ONNXXXXXXNNNNNWNNNNNNNNNNNNNNNNNNNNNNNNNNNNO;dkx",
	-- "o,;XNNNNNNNNNNNWWNNNNNNNNNNNNNNNNNNNNNNNNNNNNdcxxo",
	-- "xl'dNNNNNNNNNNNNNNNXXNNXNXKKKXNNNNNNNNNNNNNNxodxoc",
	-- "co:ckNNNNNNNNWWWNNNNXKKXNXXNNNNNNNNNNNNNNNXk'cdccc",
	-- ",;:,.l0NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNXd:kcc:okl",
	-- "lo;,,locxKNNNNNNNNNNNNNNNNNNNNNNNNNNNXkl;;,,;cx:;l",
	"OOOOOOOOOOOOOOOOOOdOOOOOOdOOOOOOx:kOOOOkOOOx:dkOOOO0NXdX",
	"OOOOOOOOOOOkOOOOOxxOOOOOOdOOOOOkx:lkOOOdxkOOdcdkOOOOXWKk",
	"kkkkkkdkkkkkOOOOOdkkOOOOkokOOOOkk:kdkkOkoxkOkd:dkO0Kk0NK",
	"OkkkkokkkxdOOOOOxokkOOOkxok0OOOkxcXKdxkkkoxkOkd:dkOOkxxx",
	"kkkkokkxdlkkOOkxodkOOOOxxlx000OxxoNNXdxxkxlxxkkocxkOOkxx",
	"xxxoxkxxcxxkOkxd:xxOOOkxxlxOOOkdoOX0OkclddocdxkxlodkOOxd",
	"xxddkxxlcdddolc::ldOOkxdocxOOOxdcxkOKXX0oloc;loolldxOOxd",
	"ddlxool;loxxdodOloddkddoxlxOOkdo0NNWWWNNNOlol:oddlodkOkd",
	"dlldddccddddlxXkoxOkdooOkokOOxdxNNWWWWNNNNNkl;;oooldxOkd",
	"dcdddo;odocoKNNodkxdoxXNddOOxooNNNWWWWNNXXKXNkc;co:odOko",
	"d:ddl;:c:ckKKKkoddodKNW0okOxodXNNNNKKK0xoolodkKk,;,lokko",
	"l;o:,;:coooodd:lcoONNNNoxkdokNNNNNK0o,. ......  cOc;oxxo",
	"c;:;............,dKNNNxdxoxKNNNNNKl.;;......:ko'  cloxdc",
	"c',...lxl:,.......;XNkooxKNNNNNNNKoKWNl''''..lX0: .lldoc",
	"cx..'OKXWWK:,,,,'.kKddOXNNNNNNNNNN0'ccdc,cc:;'WWX.'o'llc",
	";:. xWW;llco;;ccc,xNNNNNNNNNNNNNNNN,cdko.xxoc'NMN'0N;l;o",
	";0k.OMM;cldklc0Ox;ONNNNNNNNNNNNNNWWoxKKK0KKKO:MMKXNN:;:x",
	":xNXxWMkcKKKKKKKKcNNNNNNNNNNNNNNNWWNdkXXXXX0kKWWNNNN:,lk",
	"clNNNNWWxo0XXXNOkNWNNNNNNNNNNNNNNNWWW0xxxxdxXNXXXNNN;;xk",
	";:NNNNXXNXxxxkxONWWNNNNNNNNNNNNNNNNNNNNNNNXXXXXXXNNk.lkk",
	";,kNNNXXXXXXNNNNNNWNNNNNNNNNNNNNNNNNNNNNNNNXXXXNNNNl,dkk",
	"o,;XNNXXXXXNNNNNNWWNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN0:okkd",
	"dc'oXNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNklxkol",
	"dd;,kNNNNNNNNNNNNNNNNN0KKKKNKKK0KNNNNNNNNNNNNNNNNl;oxocl",
	":ll,ldNNNNNNNNWWWWNNNNNNNNNNNNNNNNNNNNNNNNNNNNN0xc;occo:",
	",,;;''dONNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNXkc,xc:;clxl",
	"od;;,,xl;oONNNNNNNNNNNNNNNNNNNNNNNNNNNNNNXkl;;;,';:dd:;l",
	"c:.;c,;:;;,;xNNNNNNNNNNNNNNNNNNNNNNNNNNXd,,,;;,.cc''';:,",
}

lvim.builtin.alpha.dashboard.section.buttons.opts.hl_shortcut = "Rose1"
lvim.builtin.alpha.dashboard.section.buttons.opts.hl = "Rose2"
lvim.builtin.alpha.dashboard.section.buttons.entries = {
	{ "f", lvim.icons.ui.FindFile .. "  Find File", "<CMD>Telescope find_files<CR>" },
	{ "n", lvim.icons.ui.NewFile .. "  New File", "<CMD>ene!<CR>" },
	{ "p", lvim.icons.ui.Project .. "  Projects ", "<CMD>Telescope projects<CR>" },
	{ "r", lvim.icons.ui.History .. "  Recent files", ":Telescope oldfiles <CR>" },
	{
		"c",
		lvim.icons.ui.Gear .. "  Configuration",
		"<CMD>edit " .. require("lvim.config"):get_user_config_path() .. " <CR>",
	},
	{ "q", lvim.icons.ui.Close .. "  Quit", "<CMD>quit<CR>" },
}
local cmd = "node -e \"console.log(require('${HOME}/.config/lvim/scripts/yiji.js').getTodayYiJi())\""
local handle = io.popen(cmd)
local result = handle:read("*a")
handle:close()
-- local yi = string.match(result, "yi: '(.*)'")
-- local ji = string.match(result, "ji: '(.*)'")
-- local date = string.match(result, "date: '(.*)'")
-- local xinZuo = string.match(result, "xinZuo: '(.*)'")
local r = string.match(result, "'(.*)'")

lvim.builtin.alpha.dashboard.section.footer.opts.hl = "Ykn"
lvim.builtin.alpha.dashboard.section.footer.val = require("lvim.interface.text").align_center({ width = "0" }, {
	r,
	-- date .. "  星座：" .. xinZuo .. "  宜：" .. yi .. "  忌：" .. ji,
}, 0.5)

-- lualine
-- lvim.builtin.lualine.style = "lvim"
lvim.builtin.lualine.style = "none"
local colors = {
	bg = "#34343b",
	fg = "#7b7b7b",
	mbg = "#262537",
	yellow = "#ff6300",
	cyan = "#477bde",
	darkblue = "#081633",
	green = "#86dd7f",
	orange = "#ffb684",
	violet = "#c678dd",
	magenta = "#c678dd",
	blue = "#5f96ca",
	red = "#ffa3be",
	grey = "#3e3d50",
	lsp = "#97ff8f",
	diff_green = "#98be65",
	diff_orange = "#ff8800",
	diff_red = "#ec5f67",
}

local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
	hide_lsp_diagnostics = function()
		return vim.o.columns > 140
	end,
	hide_diff = function()
		return vim.o.columns > 120
	end,
	hide_line_col = function()
		return vim.o.columns > 140
	end,
	hide_cwd = function()
		return vim.o.columns > 80
	end,
}

lvim.builtin.lualine.options = {
	theme = {
		normal = {
			a = { bg = colors.mbg, gui = "bold" },
			b = { bg = colors.mbg, gui = "bold" },
			c = { bg = colors.mbg, gui = "bold" },
			x = { bg = colors.mbg, gui = "bold" },
			y = { bg = colors.mbg, gui = "bold" },
			z = { bg = colors.mbg, gui = "bold" },
		},
		insert = {
			a = { bg = colors.mbg, gui = "bold" },
			b = { bg = colors.mbg, gui = "bold" },
			c = { bg = colors.mbg, gui = "bold" },
			x = { bg = colors.mbg, gui = "bold" },
			y = { bg = colors.mbg, gui = "bold" },
			z = { bg = colors.mbg, gui = "bold" },
		},
		visual = {
			a = { bg = colors.mbg, gui = "bold" },
			b = { bg = colors.mbg, gui = "bold" },
			c = { bg = colors.mbg, gui = "bold" },
			x = { bg = colors.mbg, gui = "bold" },
			y = { bg = colors.mbg, gui = "bold" },
			z = { bg = colors.mbg, gui = "bold" },
		},
		replace = {
			a = { bg = colors.mbg, gui = "bold" },
			b = { bg = colors.mbg, gui = "bold" },
			c = { bg = colors.mbg, gui = "bold" },
			x = { bg = colors.mbg, gui = "bold" },
			y = { bg = colors.mbg, gui = "bold" },
			z = { bg = colors.mbg, gui = "bold" },
		},
		command = {
			a = { bg = colors.mbg, gui = "bold" },
			b = { bg = colors.mbg, gui = "bold" },
			c = { bg = colors.mbg, gui = "bold" },
			x = { bg = colors.mbg, gui = "bold" },
			y = { bg = colors.mbg, gui = "bold" },
			z = { bg = colors.mbg, gui = "bold" },
		},
		inactive = {
			a = { bg = colors.mbg, gui = "bold" },
			b = { bg = colors.mbg, gui = "bold" },
			c = { bg = colors.mbg, gui = "bold" },
			x = { bg = colors.mbg, gui = "bold" },
			y = { bg = colors.mbg, gui = "bold" },
			z = { bg = colors.mbg, gui = "bold" },
		},
	},
	component_separators = "",
	section_separators = { left = "", right = "" },
	always_divide_middle = false,
}

lvim.builtin.lualine.sections = {
	-- these are to remove the defaults
	lualine_a = {},
	lualine_b = {},
	lualine_c = {
		{
			"mode",
			icon = "",
			color = function()
				-- auto change color according to neovims mode
				local mode_color = {
					n = colors.blue,
					i = colors.violet,
					v = colors.cyan,
					[""] = colors.cyan,
					V = colors.cyan,
					c = colors.magenta,
					R = colors.orange,
					no = colors.blue,
					s = colors.orange,
					S = colors.orange,
					[""] = colors.orange,
					ic = colors.yellow,
					Rv = colors.orange,
					cv = colors.blue,
					ce = colors.blue,
					r = colors.cyan,
					rm = colors.cyan,
					["r?"] = colors.cyan,
					["!"] = colors.blue,
					t = colors.green,
				}
				return { fg = mode_color[vim.fn.mode()], bg = colors.bg }
			end,
		},
		{
			"filetype",
			icon_only = true,
			colored = false,
			color = { fg = colors.fg },
			padding = { left = 1, right = 0 },
		},
		{
			"filename",
			cond = conditions.buffer_not_empty,
			color = { fg = colors.fg },
			padding = { left = 1, right = 1 },
		},
		{
			"branch",
			icon = "",
			color = { fg = colors.fg },
			padding = { left = 1, right = 1 },
		},
		{
			"diagnostics",
			sources = { "nvim_diagnostic" },
			symbols = { error = "󰅚 ", warn = " ", info = " ", hint = "󰛩 " },
			cond = conditions.hide_lsp_diagnostics,
			colored = true,
			always_visible = true,
		},
	},
	lualine_x = {
		{
			"diff",
			colored = true,
			symbols = { added = " ", modified = " ", removed = " " },
			diff_color = {
				added = { fg = colors.diff_green },
				modified = { fg = colors.diff_orange },
				removed = { fg = colors.diff_red },
			},
			cond = conditions.hide_diff,
		},
		{
			function()
				return "|"
			end,
			color = { fg = colors.diff_red },
			cond = conditions.hide_diff,
		},
		{
			function()
				return "Ln %l, Col %c"
			end,
			color = { fg = colors.fg },
			cond = conditions.hide_line_col,
			-- icon = "|",
		},
		{
			"o:encoding", -- option component same as &encoding in viml
			fmt = string.upper, -- I'm not sure why it's upper case either ;)
			cond = conditions.hide_in_width,
			color = { fg = colors.yellow, gui = "bold" },
		},
		{
			function()
				return "{} %Y"
			end,
			color = { fg = colors.blue, bg = colors.mbg, gui = "bold" },
			-- color = { fg = colors.blue, gui = "bold" },
		},
		{
			function()
				local msg = ""
				-- local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
				local clients = vim.lsp.get_clients()
				if next(clients) == nil then
					return msg
				end
				for _, client in ipairs(clients) do
					if client.name == "copilot" then
						return ""
					end
				end
				return msg
			end,
		},
		{
			function()
				local msg = "No Active Lsp"
				-- local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
				local clients = vim.lsp.get_clients()
				if next(clients) == nil then
					return msg
				end
				for _, client in ipairs(clients) do
					if client.name ~= "null-ls" and client.name ~= "copilot" then
						return (vim.o.columns > 100 and client.name) or "LSP"
					end
				end
				return msg
			end,
			icon = "󰄭 ",
			color = { fg = colors.lsp, bg = colors.mbg },
			-- color = { fg = colors.lsp },
		},
	},
	lualine_y = {},
	lualine_z = {
		{
			function()
				local filepath = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
				return "󰉖 " .. filepath
			end,
			color = { bg = colors.bg, fg = colors.red },
			cond = conditions.hide_cwd,
		},
	},
}

lvim.builtin.lualine.inactive_sections = {
	-- these are to remove the defaults
	lualine_a = {},
	lualine_b = {},
	lualine_y = {},
	lualine_z = {},
	lualine_c = {},
	lualine_x = {},
}

-- bufferline

lvim.builtin.bufferline.options = {
	hover = {
		enabled = true,
		delay = 200,
		reveal = { "close" },
	},
	numbers = "ordinal",
	close_command = function()
		local bufferToDelete = vim.api.nvim_get_current_buf()
		require("bufferline").cycle(-1)
		vim.cmd("bdelete!" .. bufferToDelete)
	end,
	right_mouse_command = function()
		local bufferToDelete = vim.api.nvim_get_current_buf()
		require("bufferline").cycle(-1)
		vim.cmd("bdelete!" .. bufferToDelete)
	end, -- can be a string | function | false, see "Mouse actions"
	left_mouse_command = "buffer %d", -- can be a string | function, | false see "Mouse actions"
	middle_mouse_command = nil, -- can be a string | function, | false see "Mouse actions"
	color_icons = true, -- whether or not to add the filetype icon highlights

	indicator = {
		-- icon = { "|" },
		style = "underline",
	},
	buffer_close_icon = "",
	modified_icon = "●",
	close_icon = "",
	left_trunc_marker = "",
	right_trunc_marker = "",
	max_name_length = 18,
	max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
	tab_size = 20,
	diagnostics = "nvim_lsp", -- | "nvim_lsp" | "coc",
	diagnostics_update_in_insert = false,
	diagnostics_indicator = function(count, level, diagnostics_dict, context)
		if level == "error" then
			return " " .. count
		elseif level == "warning" then
			return " " .. count
		elseif level == "info" then
			return " " .. count
		elseif level == "hint" then
			return "💡" .. count
		else
			return ""
		end
	end,
	offsets = {
		{
			filetype = "neo-tree",
			text = "󰴈 Hanasaki",
			text_align = "center",
			padding = 1,
			separator = false,
		},
	},
	show_buffer_icons = true,
	show_buffer_close_icons = true,
	show_close_icon = true,
	show_tab_indicators = true,
	persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
	separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
	enforce_regular_tabs = true,
	always_show_bufferline = true,
	custom_filter = function(buf_number, _)
		if vim.fn.bufname(buf_number) ~= "" then
			return true
		end
	end,
}

-- custom plugins
lvim.plugins = {
	{
		"iamcco/markdown-preview.nvim",
		lazy = false,
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup({
				-- your config
				enable = true,
				filetypes = {
					"html",
					"javascript",
					"typescript",
					"vue",
					"tsx",
					"jsx",
					"xml",
					"markdown",
				},
			})
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = { hint_prefix = "💮 " },
		config = function(_, opts)
			require("lsp_signature").setup(opts)
		end,
	},
	-- {
	--   "HiPhish/rainbow-delimiters.nvim",
	--   dependencies = "nvim-treesitter/nvim-treesitter",
	--   main = "rainbow-delimiters.setup",
	-- },
	--
	-- {
	--   "mg979/vim-visual-multi",
	--   event = "BufEnter",
	-- },

	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				panel = {
					enabled = true,
					auto_refresh = false,
					keymap = {
						jump_prev = "[[",
						jump_next = "]]",
						accept = "<CR>",
						refresh = "gr",
						open = "<M-CR>",
					},
					layout = {
						position = "right", -- | top | left | right
						ratio = 0.2,
					},
				},
				suggestion = {
					enabled = true,
					auto_trigger = false,
					hide_during_completion = true,
					debounce = 75,
					keymap = {
						accept = "<C-c>",
						accept_word = false,
						accept_line = false,
						next = "<]n>",
						prev = "[n>",
						dismiss = "<C-]>",
					},
				},
				filetypes = {
					yaml = false,
					markdown = false,
					help = false,
					gitcommit = false,
					gitrebase = false,
					hgcommit = false,
					svn = false,
					cvs = false,
					["."] = false,
				},
				copilot_node_command = "node", -- Node.js version must be > 18.x
				server_opts_overrides = {},
			})
		end,
	},

	{
		"mfussenegger/nvim-dap",
		config = function()
			require("dap").adapters["pwa-node"] = {
				type = "server",
				host = "localhost",
				port = "${port}",
				executable = {
					command = "node",
					args = {
						require("mason-registry").get_package("js-debug-adapter"):get_install_path()
							.. "/js-debug/src/dapDebugServer.js",
						"${port}",
					},
				},
			}
			require("dap").configurations.typescript = {
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					cwd = "${workspaceFolder}",
				},
			}
		end,
	},

	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"marilari88/neotest-vitest",
			"nvim-neotest/neotest-jest",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-vitest"),
					require("neotest-jest")({
						jestCommand = "npm test --",
						jestConfigFile = "custom.jest.config.ts",
						env = { CI = true },
						cwd = function(path)
							return vim.fn.getcwd()
						end,
					}),
				},
			})
		end,
	},

	{
		"ThePrimeagen/refactoring.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("refactoring").setup({})
		end,
	},

	{
		"brenoprata10/nvim-highlight-colors",
		lazy = false,
		config = function()
			require("nvim-highlight-colors").setup({
				---Render style
				---@usage 'background'|'foreground'|'virtual'
				render = "virtual",

				---Set virtual symbol (requires render to be set to 'virtual')
				-- virtual_symbol = '■',
				virtual_symbol = "",
				-- virtual_symbol = '',

				---Set virtual symbol suffix (defaults to '')
				virtual_symbol_prefix = "",

				---Set virtual symbol suffix (defaults to ' ')
				virtual_symbol_suffix = " ",

				---Set virtual symbol position()
				---@usage 'inline'|'eol'|'eow'
				---inline mimics VS Code style
				---eol stands for `end of column` - Recommended to set `virtual_symbol_suffix = ''` when used.
				---eow stands for `end of word` - Recommended to set `virtual_symbol_prefix = ' ' and virtual_symbol_suffix = ''` when used.
				virtual_symbol_position = "inline",

				---Highlight hex colors, e.g. '#FFFFFF'
				enable_hex = true,

				---Highlight short hex colors e.g. '#fff'
				enable_short_hex = true,

				---Highlight rgb colors, e.g. 'rgb(0 0 0)'
				enable_rgb = true,

				---Highlight hsl colors, e.g. 'hsl(150deg 30% 40%)'
				enable_hsl = true,

				---Highlight CSS variables, e.g. 'var(--testing-color)'
				enable_var_usage = true,

				---Highlight named colors, e.g. 'green'
				enable_named_colors = true,

				---Highlight tailwind colors, e.g. 'bg-blue-500'
				enable_tailwind = true,

				---Set custom colors
				---Label must be properly escaped with '%' to adhere to `string.gmatch`
				--- :help string.gmatch
				custom_colors = {
					-- { label = '%-%-theme%-primary%-color',   color = '#0f1219' },
					-- { label = '%-%-theme%-secondary%-color', color = '#5a5d64' },
				},

				-- Exclude filetypes or buftypes from highlighting e.g. 'exclude_buftypes = {'text'}'
				exclude_filetypes = {},
				exclude_buftypes = {},
			})
		end,
	},

	{
		"kevinhwang91/nvim-ufo",
		lazy = false,
		dependencies = {
			"kevinhwang91/promise-async",
			{
				"luukvbaal/statuscol.nvim",
				config = function()
					local builtin = require("statuscol.builtin")
					require("statuscol").setup({
						relculright = true,
						segments = {
							{ text = { builtin.foldfunc }, click = "v:lua.ScFa" },
							{ text = { "%s" }, click = "v:lua.ScSa" },
							{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
						},
					})
				end,
			},
		},
		config = function()
			local handler = function(virtText, lnum, endLnum, width, truncate)
				local newVirtText = {}
				local suffix = (" 󰁂 %d "):format(endLnum - lnum)
				local sufWidth = vim.fn.strdisplaywidth(suffix)
				local targetWidth = width - sufWidth
				local curWidth = 0
				for _, chunk in ipairs(virtText) do
					local chunkText = chunk[1]
					local chunkWidth = vim.fn.strdisplaywidth(chunkText)
					if targetWidth > curWidth + chunkWidth then
						table.insert(newVirtText, chunk)
					else
						chunkText = truncate(chunkText, targetWidth - curWidth)
						local hlGroup = chunk[2]
						table.insert(newVirtText, { chunkText, hlGroup })
						chunkWidth = vim.fn.strdisplaywidth(chunkText)
						-- str width returned from truncate() may less than 2nd argument, need padding
						if curWidth + chunkWidth < targetWidth then
							suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
						end
						break
					end
					curWidth = curWidth + chunkWidth
				end
				table.insert(newVirtText, { suffix, "MoreMsg" })
				return newVirtText
			end

			local ftMap = {
				vim = "indent",
				python = { "indent" },
				git = "",
			}
			require("ufo").setup({
				open_fold_hl_timeout = 150,
				close_fold_kinds_for_ft = {
					default = { "imports", "comment" },
					json = { "array" },
					c = { "comment", "region" },
				},
				preview = {
					win_config = {
						border = { "", "─", "", "", "", "─", "", "" },
						winhighlight = "Normal:Folded",
						winblend = 0,
					},
					mappings = {
						scrollU = "<C-u>",
						scrollD = "<C-d>",
						jumpTop = "[",
						jumpBot = "]",
					},
				},
				provider_selector = function(bufnr, filetype, buftype)
					return ftMap[filetype]
				end,
				fold_virt_text_handler = handler,
			})
		end,
	},

	{
		"rcarriga/nvim-notify",
		lazy = false,
		config = function()
			local notify = require("notify")
			vim.notify = notify
			notify.setup({
				on_open = function(win)
					vim.api.nvim_win_set_config(win, { border = "rounded" })
				end,
				background_colour = "#202020",
				fps = 60,
				level = 2,
				minimum_width = 50,
				render = "compact",
				stages = "fade_in_slide_out",
				timeout = 3000,
				top_down = true,
			})
			local opts = { noremap = true, silent = true }
			vim.keymap.set("n", "<LEADER>c;", notify.dismiss, opts)
		end,
	},

	{
		"stevearc/dressing.nvim",
		lazy = false,
		init = function()
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.select = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.select(...)
			end
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.input = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.input(...)
			end
		end,
	},

	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- 	{
			-- 		"3rd/image.nvim",
			-- 		dependencies = {

			-- 			"vhyrro/luarocks.nvim",
			-- 		},
			-- 		config = function()
			-- 			require("image").setup({
			-- 				integrations = {
			-- 					markdown = {
			-- 						enabled = true,
			-- 						clear_in_insert_mode = false,
			-- 						download_remote_images = true,
			-- 						only_render_image_at_cursor = false,
			-- 						filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
			-- 					},
			-- 					neorg = {
			-- 						enabled = true,
			-- 						clear_in_insert_mode = false,
			-- 						download_remote_images = true,
			-- 						only_render_image_at_cursor = false,
			-- 						filetypes = { "norg" },
			-- 					},
			-- 					html = {
			-- 						enabled = false,
			-- 					},
			-- 					css = {
			-- 						enabled = false,
			-- 					},
			-- 				},
			-- 				max_width = nil,
			-- 				max_height = nil,
			-- 				max_width_window_percentage = nil,
			-- 				max_height_window_percentage = 50,
			-- 				window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
			-- 				window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
			-- 				editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
			-- 				tmux_show_only_in_active_window = false, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
			-- 				hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- render image files as images when opened
			-- 			})
			-- 		end,
			-- 	},
		},
		config = function()
			require("neo-tree").setup({
				window = {
					mappings = {

						["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
					},
				},
				default_component_configs = {
					indent = {
						indent_size = 2,
						padding = 1, -- extra padding on left hand side
						-- indent guides
						with_markers = true,
						indent_marker = "│",
						last_indent_marker = "└",
						highlight = "NeoTreeIndentMarker",
						-- expander config, needed for nesting files
						with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
						expander_collapsed = "",
						expander_expanded = "",
						expander_highlight = "NeoTreeExpander",
					},
					git_status = {
						symbols = {
							-- Change type
							added = "✚",
							deleted = "✖",
							modified = "",
							renamed = "󰁕",
							-- Status type
							untracked = "",
							ignored = "",
							unstaged = "󰄱",
							staged = "",
							conflict = "",
						},
					},
					diagnostics = {
						symbols = {
							hint = "H",
							info = "I",
							warn = "!",
							error = "X",
						},
						highlights = {
							hint = "DiagnosticSignHint",
							info = "DiagnosticSignInfo",
							warn = "DiagnosticSignWarn",
							error = "DiagnosticSignError",
						},
					},
				},
				source_selector = {},
				-- event_handlers = {
				--     event = "file_opened",
				--     handler = function(file_path)
				--       require("neo-tree.command").execute { action = "close" }
				--     end,
				--   },
				-- },
			})
		end,
	},

	{
		"stevearc/conform.nvim",
		config = function()
			local options = {
				lsp_fallback = true,

				formatters_by_ft = {
					lua = { "stylua" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					css = { "prettier" },
					html = { "prettier" },
					vue = { "prettier" },
					python = { "ast-grep" },
					markdown = { "prettier" },

					sh = { "shfmt" },
				},

				format_on_save = {
					--   -- These options will be passed to conform.format()
					timeout_ms = 500,
					lsp_fallback = true,
				},
			}

			require("conform").setup(options)
		end,
	},

	{
		"xiyaowong/transparent.nvim",
		lazy = false,
		config = function()
			require("transparent").setup({ -- Optional, you don't have to run setup.
				groups = { -- table: default groups
					"Normal",
					"NormalNC",
					"Comment",
					"Constant",
					"Special",
					"Identifier",
					"Statement",
					"PreProc",
					"Type",
					"Underlined",
					"Todo",
					"String",
					"Function",
					"Conditional",
					"Repeat",
					"Operator",
					"Structure",
					"LineNr",
					"NonText",
					"SignColumn",
					"CursorLine",
					"CursorLineNr",
					"StatusLine",
					"StatusLineNC",
					"EndOfBuffer",
				},
				extra_groups = {
					"NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
					"WinBar",
					"WinBarNC",
				}, -- table: additional groups that should be cleared
				exclude_groups = {}, -- table: groups you don't want to clear
			})

			require("transparent").clear_prefix("NeoTree")
		end,
	},

	{
		"Bekaboo/dropbar.nvim",
		-- commit = "19011d96959cd40a7173485ee54202589760caae",
		config = function()
			local api = require("dropbar.api")
			-- vim.keymap.set("n", "<Leader>;", api.pick)
			-- vim.keymap.set("n", "[c", api.goto_context_start)
			-- vim.keymap.set("n", "]c", api.select_next_context)

			local confirm = function()
				local menu = api.get_current_dropbar_menu()
				if not menu then
					return
				end
				local cursor = vim.api.nvim_win_get_cursor(menu.win)
				local component = menu.entries[cursor[1]]:first_clickable(cursor[2])
				if component then
					menu:click_on(component)
				end
			end

			local quit_curr = function()
				local menu = api.get_current_dropbar_menu()
				if menu then
					menu:close()
				end
			end

			require("dropbar").setup({
				menu = {
					-- When on, automatically set the cursor to the closest previous/next
					-- clickable component in the direction of cursor movement on CursorMoved
					quick_navigation = true,
					---@type table<string, string|function|table<string, string|function>>
					win_configs = {
						border = "rounded",
					},
					keymaps = {
						["<LeftMouse>"] = function()
							local menu = api.get_current_dropbar_menu()
							if not menu then
								return
							end
							local mouse = vim.fn.getmousepos()
							if mouse.winid ~= menu.win then
								local parent_menu = api.get_dropbar_menu(mouse.winid)
								if parent_menu and parent_menu.sub_menu then
									parent_menu.sub_menu:close()
								end
								if vim.api.nvim_win_is_valid(mouse.winid) then
									vim.api.nvim_set_current_win(mouse.winid)
								end
								return
							end
							menu:click_at({ mouse.line, mouse.column }, nil, 1, "l")
						end,
						["<CR>"] = confirm,
						["i"] = confirm,
						["<esc>"] = quit_curr,
						["q"] = quit_curr,
						["n"] = quit_curr,
						["<MouseMove>"] = function()
							local menu = api.get_current_dropbar_menu()
							if not menu then
								return
							end
							local mouse = vim.fn.getmousepos()
							if mouse.winid ~= menu.win then
								return
							end
							menu:update_hover_hl({ mouse.line, mouse.column - 1 })
						end,
					},
				},
			})
		end,
	},
	{
		"gelguy/wilder.nvim",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			local wilder = require("wilder")
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
				gradient[i] =
					wilder.make_hl("WilderGradient" .. i, "Pmenu", { { a = 1 }, { a = 1 }, { foreground = fg } })
			end
			wilder.setup({
				modes = { ":" },
				next_key = "<Tab>",
				previous_key = "<S-Tab>",
			})
			wilder.set_option(
				"renderer",
				wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
					pumblend = 0,
					highlights = {
						border = "Normal",
						gradient = gradient,
					},
					border = "rounded",
					highlighter = wilder.highlighter_with_gradient({
						wilder.basic_highlighter(),
					}),
					left = { " ", wilder.popupmenu_devicons() },
					right = { " ", wilder.popupmenu_scrollbar() },
				}))
			)
			wilder.set_option("pipeline", {
				wilder.branch(
					wilder.cmdline_pipeline({
						language = "vim",
						fuzzy = 1,
					}),
					wilder.search_pipeline()
				),
			})
		end,
	},

	{
		"kdheepak/lazygit.nvim",
		lazy = false,
		dependencies = { "akinsho/toggleterm.nvim" },
		config = function()
			vim.g.lazygit_floating_window_scaling_factor = 0.9
			vim.g.lazygit_floating_window_winblend = 0
			vim.g.lazygit_use_neovim_remote = true
		end,
	},

	{
		"shellRaining/hlchunk.nvim",
		lazy = false,
		init = function()
			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, { pattern = "*", command = "EnableHL" })
			require("hlchunk").setup({
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
			})
		end,
	},

	{
		"petertriho/nvim-scrollbar",
		lazy = false,
		dependencies = {
			"kevinhwang91/nvim-hlslens",
		},
		config = function()
			local group = vim.api.nvim_create_augroup("scrollbar_set_git_colors", {})
			vim.api.nvim_create_autocmd("BufEnter", {
				pattern = "*",
				callback = function()
					vim.cmd([[
hi! ScrollbarGitAdd guifg=#8CC85F
hi! ScrollbarGitAddHandle guifg=#A0CF5D
hi! ScrollbarGitChange guifg=#E6B450
hi! ScrollbarGitChangeHandle guifg=#F0C454
hi! ScrollbarGitDelete guifg=#F87070
hi! ScrollbarGitDeleteHandle guifg=#FF7B7B ]])
				end,
				group = group,
			})
			require("scrollbar.handlers.search").setup({})
			require("scrollbar.handlers.gitsigns").setup()
			require("scrollbar.handlers.cursor").setup()
			require("scrollbar").setup({
				show = true,
				handle = {
					text = " ",
					color = "#928374",
					hide_if_all_visible = true,
					-- },
					marks = {
						Search = { color = "yellow" },
						Misc = { color = "purple" },
					},
					handlers = {
						cursor = false,
						diagnostic = true,
						gitsigns = true,
						handle = true,
						search = true,
					},
				},
			})
		end,
	},
}
