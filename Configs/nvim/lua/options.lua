vim.g.leader = ' '
vim.g.localleader = ' '

vim.o.clipboard = 'unnamedplus'

vim.o.number = true
vim.o.relativenumber = true

vim.o.signcolumn = 'yes'

vim.o.tabstop = 4
vim.o.shiftwidth = 4

vim.o.updatetime = 300

vim.o.termguicolors = true

vim.o.mouse = 'a'

vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>pp', vim.cmd.Ex)

-- Markdown Preview
vim.keymap.set('n', '<C-s>', vim.cmd.MarkdownPreview)
vim.keymap.set('n', '<M-s>', vim.cmd.MarkdownPreviewStop)
vim.keymap.set('n', '<C-p>', vim.cmd.MarkdownPreviewToggle)
