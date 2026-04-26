local plugins = {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
  },

  {
    'rmehri01/onenord.nvim',
    lazy = false,
    priority = 1000,
    config = function() require 'extensions.onenord' end,
  },

  {
    'nvim-lualine/lualine.nvim',
    config = function() require 'extensions.lualine' end,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'neovim/nvim-lspconfig', 'lewis6991/gitsigns.nvim', 'SmiteshP/nvim-navic',
    },
  },


  {
    'kevinhwang91/nvim-hlslens',
    config = function() require 'extensions.nvim-hlslens' end,
  },

  {
    'lewis6991/gitsigns.nvim',
    config = function() require 'extensions.gitsigns' end,
  },

  {
    'petertriho/nvim-scrollbar',
    config = function() require 'extensions.nvim-scrollbar' end,
    dependencies = {
      'kevinhwang91/nvim-hlslens', 'lewis6991/gitsigns.nvim',
    },
  },

  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x', -- or... tag = '0.1.1'
    config = function() require 'extensions.telescope' end,
    dependencies = {
      'nvim-tree/nvim-web-devicons', 'nvim-lua/plenary.nvim',
    },
  },

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make'
  },

  {
    'nvim-tree/nvim-tree.lua',
    config = function() require 'extensions.nvim-tree' end,
    dependencies = { 'nvim-tree/nvim-web-devicons', 'nvim-telescope/telescope.nvim' },
  },

  {
    'neovim/nvim-lspconfig',
    config = function() require 'extensions.nvim-lspconfig' end,
  },

  {
    'williamboman/mason.nvim',
    config = function() require 'extensions.mason' end,
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
    },
  },

  {
    'SmiteshP/nvim-navic',
    config = function() require 'extensions.nvim-navic' end,
    dependencies = 'neovim/nvim-lspconfig',
  },

  {
    "hasansujon786/nvim-navbuddy",
    config = function() require 'extensions.nvim-navbuddy' end,
    dependencies = {
      'neovim/nvim-lspconfig', 'SmiteshP/nvim-navic', 'MunifTanjim/nui.nvim', 'numToStr/Comment.nvim',
      'nvim-telescope/telescope.nvim'
    },
  },

  {
    'hrsh7th/nvim-cmp',
    config = function() require 'extensions.nvim-cmp' end,
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-path',
      'onsails/lspkind-nvim',
    },
  },

  {
    'L3MON4D3/LuaSnip',
    version = "v2.*",
    build = 'make install_jsregexp',
    config = function() require 'extensions.luasnip' end,
    dependencies = { 'saadparwaiz1/cmp_luasnip', 'rafamadriz/friendly-snippets' },
  },

  {
    'j-hui/fidget.nvim',
    lazy = false,
    priority = 900,
    config = function() require 'extensions.fidget' end,
  },

  {
    'folke/trouble.nvim',
    config = function() require 'extensions.trouble' end,
    dependencies = 'nvim-tree/nvim-web-devicons',
  },

  {
    'rcarriga/nvim-notify',
    config = function() require 'extensions.nvim-notify' end,
  },

  {
    'nvimtools/none-ls.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function() require 'extensions.none-ls' end,
  },

  {
    'jay-babu/mason-null-ls.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'williamboman/mason.nvim',
      'nvimtools/none-ls.nvim',
    },
    opts = {
      handlers = {}
    },
  },

  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },

  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function() require 'extensions.toggleterm' end,
  },

  {
    'pogyomo/submode.nvim',
    lazy = false,
    version = "6.0.0",
    dependencies = {
      'pogyomo/winresize.nvim',
    },
    config = function() require 'extensions.submode' end,
  },

  {
    'pogyomo/winresize.nvim',
  },


}

local opts = {

  checker = {
    enabled = true,
  },

  performance = {
    rtp = {
      disabled_plugins = {
        'gzip',
        'matchit',
        --'matchparen',
        --'netrwPlugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup(plugins, opts)
