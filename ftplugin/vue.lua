local opts = {
	on_attach = function(client, _)
		client.server_capabilities = vim.tbl_extend("force", client.server_capabilities, {
			workspace = {
				didChangeWatchedFiles = { dynamicRegistration = true },
			},
		})
	end,
	init_options = {
		vue = {
			hybridMode = false,
		},
	},
	settings = {
		vue = {
			updateImportsOnFileMove = { enabled = true },
		},
	},
}

require("lvim.lsp.manager").setup("volar", opts)
