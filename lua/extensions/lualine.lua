-- onenord.nvim のカラーパレットを取得する
local colors = require('onenord.colors').load()

require('lualine').setup {

  options = {
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    globalstatus = true,
  },

  sections = {
    lualine_a = {
      'mode',
    },
    lualine_b = {
      {
        'filename',
        newfile_status = true,
        path = 1,
        shorting_target = 24,
        symbols = { modified = '_󰷥', readonly = ' ', newfile = '󰄛' },
      },
    },
    lualine_c = {
      {
        'diagnostics',
        sources = { 'nvim_diagnostic', 'nvim_lsp' },
        sections = { 'error', 'warn', 'info', 'hint' },
        symbols = { error = ' ', warn = ' ', info = ' ', hint = '' },
      },
      { 'navic' }
    },

    lualine_x = {
      { 'diff', symbols = { added = ' ', modified = ' ', removed = ' ' }, source = diff_source },
      {
        require("lazy.status").updates,
        cond = require("lazy.status").has_updates,
        color = { fg = "#ff9e64" },
      },
    },

    lualine_y = {
      { 'b:gitsigns_head', icon = { '', color = { fg = colors.orange } }, color = { fg = colors.fg } },
    },


    lualine_z = {
      { 'fileformat', icons_enabled = true, separator = { left = '', right = '' } },
    },
  },
}

vim.api.nvim_set_option('showmode', false)
