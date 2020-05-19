set nocompatible
filetype off
let mapleader=' '
let g:solarized_termcolors=256
set background=dark

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on

syntax on

set relativenumber
set visualbell
set encoding=utf-8
" the below settings cause splits to behave a little more normally
set splitright
set splitbelow

" *.tex treated as LaTeX instead of sometimes being considered plaintex
let g:tex_flavor = "latex"

noremap ; l
noremap l k
noremap k j
noremap j h

" super nice remap to move splits via <leader>(movekey)
nnoremap <leader>j <C-w>h
nnoremap <leader>k <C-w>j 
nnoremap <leader>l <C-w>k 
nnoremap <leader>; <C-w>l 

cnoremap w w!

" latex bindings: 
" bold/italic via Ctrl-(b/i) similar to word. 
" start subsection with Ctrl-s
" save with Ctrl-Shift-s
" start a list with Ctrl-l???
" Note: below are repeated for tex and plaintex as neovim Filetype of .tex
" appears to be inconsistent
autocmd Filetype tex 	inoremap \bb <Esc>bi\textbf{<Esc>ea}
"inoremap <C-i> <Esc>bi\textit{<Esc>ea}
autocmd Filetype tex 	inoremap \ii <Esc>bi\textit{<Esc>ea}
"inoremap <C-i> <Esc>bi\textit{<Esc>ea}
" Below remap causes forward slash+cc to insert the current copied X11 buffer.
" Could be cleaner but it works
autocmd Filetype tex 	inoremap \cc \autocite{<Esc>:set paste<CR>"+p<Esc>:set nopaste<CR>i<BS><Esc>A}
