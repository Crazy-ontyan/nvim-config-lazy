local colors = require('onenord.colors').load()

require('onenord').setup {
  theme = 'dark',
  borders = true,

  styles = {
    comments = 'NONE',
    strings = 'NONE',
    keywords = 'bold',
    functions = 'bold',
    variables = 'NONE',
    diagnostics = 'underline',
  },

  disable = {
    background = true,
  },

  custom_highlights = {
    Normal = { bg = 'NONE' },
    NormalNC = { bg = 'NONE' },
    NormalFloat = { bg = 'NONE' },
    SignColumn = { bg = 'NONE' },
    EndOfBuffer = { bg = 'NONE' },
    MatchParen = { fg = colors.none, bg = colors.none, style = 'bold,underline' },
  },
  custom_colors = {
    mypink = '#FFB2CC',
  },
}

vim.cmd.colorscheme('onenord')

