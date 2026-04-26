vim.loader.enable()

-- Leaderはキーマップ定義より前に設定する
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require 'options'
require 'extensions'

-- 基本設定
local opt = vim.opt

-- 「※」等の記号を打つと、半角文字と重なる問題がある。「※」などを全角文字の幅で表示するために設定する
opt.ambiwidth = 'double'

-- 新しい行を改行で追加した時に、ひとつ上の行のインデントを引き継がせます。
opt.autoindent = true
opt.smartindent = true
-- smartindent と cindent を両方 true にしたときは、cindent のみ true になるようです。
-- opt.cindent = true
-- -- カーソルが存在する行にハイライトを当ててくれます。
opt.cursorline = true
opt.number = true         -- 行番号
opt.relativenumber = true -- 相対行番号
opt.tabstop = 2           -- タブ幅
opt.shiftwidth = 2        -- インデント幅
opt.expandtab = true      -- タブをスペースに
--opt.termguicolors = true  -- トゥルーカラー

vim.api.nvim_set_var('loaded_netrw', 1)
vim.api.nvim_set_var('loaded_netrwPlugin', 1)
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = true,
})

opt.ambiwidth = "single"


