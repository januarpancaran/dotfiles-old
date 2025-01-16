return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "bash", "c", "cpp", "css", "html", "java", "javascript", "json", "lua", "python", "rust", "sql", "svelte", "typescript", "vue" },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end
	}
}
