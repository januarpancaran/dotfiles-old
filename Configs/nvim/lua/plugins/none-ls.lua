return {
	"nvimtools/none-ls.nvim",
	dependencies = { "nvimtools/none-ls-extras.nvim" },
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- Bash
				null_ls.builtins.formatting.shfmt,

				-- Lua
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.completion.spell,

				-- JS and TS
				require("none-ls.diagnostics.eslint_d"), -- TS | JS
				require("none-ls.code_actions.eslint_d"),
				require("none-ls.formatting.beautysh"),
				require("none-ls.formatting.eslint_d"),
				require("none-ls.formatting.jq"),

				-- Css
				null_ls.builtins.diagnostics.stylelint,

				-- Golang
				null_ls.builtins.diagnostics.staticcheck,
				null_ls.builtins.formatting.asmfmt,

				-- Cpp
				require("none-ls.diagnostics.cpplint"),
				null_ls.builtins.formatting.clang_format.with({
					extra_args = { "--style=file" }
				}),

				-- Python
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,

				null_ls.builtins.formatting.prettierd.with({
					filetypes = {
						"javascript",
						"javascriptreact",
						"typescript",
						"typescriptreact",
						"vue",
						"css",
						"scss",
						"less",
						"html",
						"json",
						"jsonc",
						"yaml",
						"markdown",
						"markdown.mdx",
						"graphql",
						"handlebars",
					},
					extra_filetypes = { "toml", "svelte" },
				}),
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end
}
