set nocompatible
filetype off
let mapleader=' '
let g:solarized_termcolors=256
set background=dark

set updatetime=300

set hidden
set cmdheight=2
set shortmess+=c

set scl=no
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
" if has("patch-8.1.1564")
"   " Recently vim can merge signcolumn and number column into one
"   set signcolumn=number
" else
"   set signcolumn=yes
" endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'neoclide/coc.nvim'
Plugin 'junegunn/fzf.vim'
Plugin 'sheerun/vim-polyglot'

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

" Comfy fzf keybindings
nnoremap <C-b> :Buffers<CR>
nnoremap <C-g> :GFiles<CR>
nnoremap <C-s> :Rg 
nnoremap <C-f> :FZF<CR>


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

" Use K to show documentation in preview window. From ChristianChiarulli nvim
" configs
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
