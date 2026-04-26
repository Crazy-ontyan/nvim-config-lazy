local snippet_dir = vim.fn.stdpath('config') .. '/lua/snippets'
local friendly_snippets_dir = vim.fn.stdpath('data') .. '/lazy/friendly_snippets'

require('luasnip.loaders.from_vscode').lazy_load {
  paths = {
    friendly_snippets_dir,
    snippet_dir,
  },
}
