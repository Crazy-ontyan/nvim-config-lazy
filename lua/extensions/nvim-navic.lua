require('nvim-navic').setup {
  lsp = {
    auto_attach = true,
  },
  highlight = true,
  depth_limit = 9,
  icons = {
    File = ' ',
    Module = ' ',
    Namespace = ' ',
    Package = ' ',
    Class = ' ',
    Method = ' ',
    Property = ' ',
    Field = ' ',
    Constructor = ' ',
    Enum = ' ',
    Interface = ' ',
    Function = ' ',
    Variable = ' ',
    Constant = ' ',
    String = ' ',
    Number = ' ',
    Boolean = ' ',
    Array = ' ',
    Object = ' ',
    Key = ' ',
    Null = ' ',
    EnumMember = ' ',
    Struct = ' ',
    Event = ' ',
    Operator = ' ',
    TypeParameter = ' ',
  },
}

vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup('nvim-navic', {}),
  callback = function()
    if vim.api.nvim_buf_line_count(0) > 10000 then
      vim.b.navic_lazy_update_context = true
    end
  end,
})

