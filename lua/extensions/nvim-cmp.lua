local cmp = require 'cmp'
local luasnip = require 'luasnip'

local map = cmp.mapping

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match '%s' == nil
end

-- Neovim 0.12 ships default <Tab>/<S-Tab> snippet maps.
-- Remove them first so cmp SuperTab can take precedence.
pcall(vim.keymap.del, 'i', '<Tab>')
pcall(vim.keymap.del, 's', '<Tab>')
pcall(vim.keymap.del, 'i', '<S-Tab>')
pcall(vim.keymap.del, 's', '<S-Tab>')

cmp.setup {
  mapping = map.preset.insert {
    ['<C-d>'] = map.scroll_docs(-4),
    ['<C-f>'] = map.scroll_docs(4),
    ['<C-Space>'] = map.complete(),
    ['<C-e>'] = map.abort(),
    ['<CR>'] = map.confirm { select = false },

  },

  sources = cmp.config.sources {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
  },

  snippet = {
    expand = function(args)
    luasnip.lsp_expand(args.body)
    end,
  },

  formatting = {
    format = require('lspkind').cmp_format {
      mode = 'symbol',
      preset = 'codicons',
    },
  },
}

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources {
    { name = 'cmdline' },
  },
})

cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources {
    {
      name = 'buffer',
      option = {
        keyword_pattern = [[\k\+]],
      },
    },
  },
})

vim.keymap.set({ 'i', 's' }, '<Tab>', function()
  if cmp.visible() then
    cmp.select_next_item()
    return ''
  end
  if luasnip.expand_or_locally_jumpable() then
    luasnip.expand_or_jump()
    return ''
  end
  if has_words_before() then
    cmp.complete()
    return ''
  end
  return '<Tab>'
end, { expr = true, silent = true, desc = 'cmp supertab next' })

vim.keymap.set({ 'i', 's' }, '<S-Tab>', function()
  if cmp.visible() then
    cmp.select_prev_item()
    return ''
  end
  if luasnip.locally_jumpable(-1) then
    luasnip.jump(-1)
    return ''
  end
  return '<S-Tab>'
end, { expr = true, silent = true, desc = 'cmp supertab prev' })

vim.lsp.config('*', {
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
})
