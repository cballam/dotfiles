set nocompatible
filetype off

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

let g:solarized_termcolors=256

noremap ; l
noremap l k
noremap k j
noremap j h

" remap ctrl-(movekey) to swap between windows
nnoremap <C-j> <c-w>h
nnoremap <C-k> <c-w>j
nnoremap <C-l> <c-w>k
nnoremap <C-;> <c-w>l


cnoremap w w!

" latex bindings: 
" bold/italic via Ctrl-(b/i) similar to word. 
" start subsection with Ctrl-s
" save with Ctrl-Shift-s
" start a list with Ctrl-l???
"inoremap <C-b> <Esc>bi\textbf{<Esc>ea}
"inoremap <C-i> <Esc>bi\textit{<Esc>ea}
"inoremap <C-s> \subsection{}<Esc>i
"inoremap <C-S> <Esc>:w<CR>i

