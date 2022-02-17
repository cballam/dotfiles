-- Global options
vim.o.updatetime = 250
vim.o.background = 'dark'
vim.o.visualbell = false
vim.o.hidden = true
vim.o.title = true
vim.o.fileencoding = 'utf-8'
vim.o.filetype = 'off'
vim.o.cmdheight = 2
vim.o.syntax = 'on'
vim.o.splitright = true
vim.o.splitbelow = true

-- Window options
vim.wo.number = true

-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "
--vim.g.coq_settings = {["auto-start"] = true}

-- Colorscheme
vim.cmd [[
 colorscheme PaperColor
 hi Normal guibg=None ctermbg=None
 hi PmenuSel     ctermfg=DarkGray          ctermbg=232         cterm=Bold
 hi PmenuSbar    ctermfg=247         ctermbg=233         cterm=Bold
 hi PmenuThumb   ctermfg=248         ctermbg=233         cterm=None
]]
