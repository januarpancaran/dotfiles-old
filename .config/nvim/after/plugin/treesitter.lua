require('nvim-treesitter.configs').setup {
	ensure_installed = { 'vim', 'vimdoc', 'javascript', 'typescript', 'c', 'cpp', 'lua', 'python', 'rust', 'java', 'bash', 'go', 'html', 'css' },
	
	sync_install = false,
	auto_install = false,

	highlight = { enable = true },
	
	indent = { enable = true },
}
