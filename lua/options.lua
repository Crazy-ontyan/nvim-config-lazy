vim.api.nvim_set_option('termguicolors', true)
vim.api.nvim_set_option('scrolloff', 4)
vim.api.nvim_set_option('ignorecase', true)
vim.api.nvim_set_option('smartcase', true)
vim.api.nvim_set_option('inccommand', 'split')
vim.api.nvim_set_option('clipboard', 'unnamedplus')
vim.api.nvim_win_set_option(0, 'signcolumn', 'yes:1')
vim.api.nvim_win_set_option(0, 'wrap', false)
vim.opt.winblend = 18 --ウィンドウの不透明度
vim.opt.pumblend = 18 --ポップアップメニューの不透明度
