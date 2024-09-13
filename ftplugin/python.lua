local M = {
	settings = {
		python = {
			analysis = { typeCheckingMode = "standard" },
		},
	},
}

require("lvim.lsp.manager").setup("basedpyright", M)
