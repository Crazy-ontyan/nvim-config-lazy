require('null-ls').setup()

vim.keymap.set('n', '<localleader>fo', function()
  vim.lsp.buf.format {
    timeout_ms = 200,
    async = true,
  }
end)
