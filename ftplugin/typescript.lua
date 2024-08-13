local map = vim.keymap.set

local M = {
	on_attach = function(client, bufnr)
		local function opts(desc)
			return { buffer = true, desc = "vtsls" .. desc }
		end

		map("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
		map("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
		map("n", "gi", vim.lsp.buf.implementation, opts("Go to implementation"))
		map("n", "<leader>sh", vim.lsp.buf.signature_help, opts("Show signature help"))
		map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts("Add workspace folder"))
		map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts("Remove workspace folder"))

		map("n", "<leader>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts("List workspace folders"))

		map("n", "<leader>D", vim.lsp.buf.type_definition, opts("Go to type definition"))

		map("n", "<leader>ra", function()
			require("nvchad.lsp.renamer")()
		end, opts("NvRenamer"))

		map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("Code action"))
		map("n", "gr", vim.lsp.buf.references, opts("Show references"))
		map("n", "H", vim.lsp.buf.hover, opts("Hover"))

		map("n", "<leader>lA", function()
			vim.lsp.buf.code_action({
				context = {
					only = {
						"source",
						"refactor",
						"quickfix",
					},
					diagnostics = client.diagnostics,
				},
			})
		end, opts("Lsp All action"))
		client.server_capabilities = vim.tbl_extend("force", client.server_capabilities, {
			workspace = {
				didChangeWatchedFiles = { dynamicRegistration = true },
				fileOperations = {
					didRename = {
						filters = {
							{
								pattern = {
									glob = "**/*.{ts,cts,mts,tsx,js,cjs,mjs,jsx,vue}",
								},
							},
						},
					},
				},
			},
		})
	end,
	-- on_attach = on_attach,
	on_init = lvim.lsp.on_init_callback,
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
		"vue",
	},
	settings = {
		complete_function_calls = true,
		vtsls = {
			tsserver = {
				globalPlugins = {
					{
						name = "@vue/typescript-plugin",
						location = require("mason-registry").get_package("vue-language-server"):get_install_path()
							.. "/node_modules/@vue/language-server",
						languages = { "vue" },
						configNamespace = "typescript",
						enableForWorkspaceTypeScriptVersions = true,
					},
				},
			},
			enableMoveToFileCodeAction = true,
			autoUseWorkspaceTsdk = true,
			experimental = {
				completion = {
					enableServerSideFuzzyMatch = true,
				},
			},
		},
		typescript = {
			updateImportsOnFileMove = { enabled = "always" },
			suggest = {
				completeFunctionCalls = true,
			},
			inlayHints = {
				parameterNames = { enabled = "literals" },
				parameterTypes = { enabled = false },
				variableTypes = { enabled = false },
				propertyDeclarationTypes = { enabled = true },
				functionLikeReturnTypes = { enabled = false },
				enumMemberValues = { enabled = true },
			},
		},
		javascript = {
			updateImportsOnFileMove = { enabled = "always" },
			inlayHints = {
				parameterNames = { enabled = "literals" },
				parameterTypes = { enabled = false },
				variableTypes = { enabled = false },
				propertyDeclarationTypes = { enabled = true },
				functionLikeReturnTypes = { enabled = false },
				enumMemberValues = { enabled = true },
			},
		},
	},
}

require("lvim.lsp.manager").setup("vtsls", M)

-- local opts = {
-- 	on_attach = function(client, _)
-- 		client.server_capabilities = vim.tbl_extend("force", client.server_capabilities, {
-- 			workspace = {
-- 				didChangeWatchedFiles = { dynamicRegistration = true },
-- 			},
-- 		})
-- 	end,
-- 	init_options = {
-- 		vue = {
-- 			hybridMode = false,
-- 		},
-- 	},
-- 	settings = {
-- 		vue = {
-- 			updateImportsOnFileMove = { enabled = true },
-- 		},
-- 	},
-- }

-- require("lvim.lsp.manager").setup("volar", opts)
