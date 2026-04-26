local telescope = require 'telescope'
local themes = require 'telescope.themes'
local builtin = require 'telescope.builtin'

telescope.setup {
  defaults = {
    preview = {
      treesitter = false,
    },
    mappings = {
      i = {
        ['<C-h>'] = 'which_key',
        ['<esc>'] = require('telescope.actions').close,
      },
      n = {
        ['<C-h>'] = 'which_key',
      }
    },
    winblend = 20,
  },
}

vim.api.nvim_set_keymap('n', '<Leader>ff', "<cmd>Telescope find_files<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fg', "<cmd>Telescope live_grep<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fb', "<cmd>Telescope buffers<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fh', "<cmd>Telescope help_tags<CR>", { noremap = true, silent = true })

vim.keymap.set('n', '<leader>h', function()
  builtin.help_tags(themes.get_ivy())
end)

