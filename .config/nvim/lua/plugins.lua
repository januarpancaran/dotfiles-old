return {
	-- gruvbox.nvim
	{
		'ellisonleao/gruvbox.nvim',
		priority = 1000,
		config = function()
			vim.cmd('colorscheme gruvbox')
		end
	},

	-- Comment.nvim
	{
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	},

	-- lualine.nvim
	{
		'nvim-lualine/lualine.nvim',
		dependencies = {
			'nvim-tree/nvim-web-devicons',
		},
		config = function()
			require('lualine').setup({
				icons_enabled = true,
				theme = 'gruvbox',
			})
		end
	},

	-- mason.nvim && lspconfig
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	'neovim/nvim-lspconfig',
	'folke/neodev.nvim',

	-- nvim-cmp
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			'L3M0N4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
			'rafamadriz/friendly-snippets',
			'hrsh7th/cmp-nvim-lsp',
		},
	},

	-- telescope.nvim
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		-- or                              , branch = '0.1.x',
      	dependencies = { 'nvim-lua/plenary.nvim' }
	},

	-- nvim-treesitter
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
	},

	-- gitsigns.nvim
	'lewis6991/gitsigns.nvim'
}
