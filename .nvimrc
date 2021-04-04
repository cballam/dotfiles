set nocompatible
filetype off
let mapleader=' '
let g:solarized_termcolors=256
set background=dark
set path=.,**
"set spell spelllang=en
"set spellsuggest=best

hi Pmenu        ctermfg=LightGray         ctermbg=233         cterm=None
hi PmenuSel     ctermfg=DarkGray          ctermbg=232         cterm=Bold
hi PmenuSbar    ctermfg=247         ctermbg=233         cterm=Bold
hi PmenuThumb   ctermfg=248         ctermbg=233         cterm=None
" vanilla Vim
set updatetime=300

set hidden
set cmdheight=2
set shortmess+=c
set incsearch
" Show modification of substitution command in split
set inccommand=split
"set wrap
"set tw=80

"set scl=no
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

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'neoclide/coc.nvim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'antoinemadec/coc-fzf'
Plugin 'yuki-ycino/fzf-preview.vim'
Plugin 'neoclide/coc-snippets'
Plugin 'sheerun/vim-polyglot'
Plugin 'ap/vim-css-color'
Plugin 'liuchengxu/vista.vim'

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

let g:fzf_preview_command = "bat {}"

noremap ; l
noremap l k
noremap k j
noremap j h

" super nice remap to move splits via <leader>(movekey)
nnoremap <leader>j <C-w>h
nnoremap <leader>k <C-w>j 
nnoremap <leader>l <C-w>k 
nnoremap <leader>; <C-w>l 
tnoremap <leader>j <C-\><C-N><C-w>h
tnoremap <leader>k <C-\><C-N><C-w>j 
tnoremap <leader>l <C-\><C-N><C-w>k 
tnoremap <leader>; <C-\><C-N><C-w>l 

command! -bang -nargs=? -complete=dir GFiles
    \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

command! -bang -nargs=? -complete=dir LocalGFiles
    \ call fzf#vim#gitfiles(expand('%:h'), fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

command! -bang -nargs=? -complete=dir Buffers
    \ call fzf#vim#buffers(<q-args>, fzf#vim#with_preview({'options': ['--info=inline']}), <bang>0)

" Fun fancy terminal remapping
nnoremap <leader>ot :sp<CR>:resize 10<CR>:term<CR>
tnoremap <F1> <C-\><C-n>

" Comfy fzf keybindings
nnoremap <C-b> :Buffers<CR>
nnoremap <C-g> :GFiles<CR>
nnoremap <C-f> :Files<CR>
nnoremap <leader>g :CocCommand fzf-preview.GitStatus<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>b :BLines<CR>
" 'Search File' to look for lines with word under cursor
nnoremap <leader>sf yiw:BLines <C-r><C-w><CR>

" More comfy bindings:
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Rg bindings:
" In visual mode, use ctrl-s to yank the current word to a buffer and then use
" Rg to search for that word. Might look at <cword> for this in the future
nnoremap <C-s> :Rg 
nnoremap <leader>s yiw:Rg <C-r><C-w><CR>
vnoremap <C-s> <Esc>yiw:Rg <C-r><C-w><CR>

" coc-fzf bindings
nnoremap <silent> <leader>d :<C-u>CocFzfList diagnostics --current-buf<CR>
" Basically show variables+functions. super useful
nnoremap <silent> <leader>o :<C-u>CocFzfList outline --current-buf<CR> 
" symbols, which is pretty cool
inoremap <silent> <C-s> <C-c>:CocFzfList symbols<CR>

" fix the thing (if coc knows how)
nmap <leader>fc <Plug>(coc-fix-current)

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

let g:fzf_layout = {'window': {'width': 0.8, 'height': 0.6}}

" Use K to show documentation in preview window. From ChristianChiarulli nvim
" configs
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')


" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover', 'float')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

nnoremap <silent> <leader>K :set invsplitbelow<CR>:call CocAction('doHover', 'preview')<CR>:set invsplitbelow<CR>

" Messy function to toggle vista coc sidebar
function! VistaCoCToggle()
  if vista#sidebar#IsOpen()
    call vista#sidebar#Close()
  else
    " runs :Vista coc
    call vista#executive#coc#Execute(v:false, v:true)
  endif
endfunction

" open vista CoC instead of ctags
nmap <F8> :call VistaCoCToggle()<CR>

" A bit of a mess from vimwiki: https://vim.fandom.com/wiki/Fuzzy_insert_mode_completion_(using_FZF)
" Allows for FZF based completion of words
function! PInsert2(item)
  " set register z to be the item that was passed
	let @z=a:item
  " in normal mode, paste text (p) from register z ("z)
	norm "zp
	call feedkeys('a')
endfunction

" get input from the current suggestions, pipe to fzf, and insert selected in
" normal mode
function! CompleteInf()
	let nl=[]
  " complete_info is a normal vim function which gets a dict of suggestions
  " from insert mode (CoC provided list)
	let l=complete_info()
	for k in l['items']
    " for every word, add it to the list as first item and info as the second
		call add(nl, k['word']. ' : ' .k['info'] . ' '. k['menu'] )
	endfor 
  " call fzf and pipe in the dictionary above (modified slightly). set the
  " output 'sink' to paste the result directly
	call fzf#vim#complete(fzf#wrap({ 'source': nl,'reducer': { lines -> split(lines[0], '\zs :')[0] },'sink':function('PInsert2')}))
endfunction 

imap <c-x> <CMD>:call CompleteInf()<CR>

let g:fzf_preview_git_status_preview_command =  "[[ $(git diff --cached -- {-1}) != \"\" ]] && git diff --cached --color=always -- {-1} | delta || " .
\ "[[ $(git diff -- {-1}) != \"\" ]] && git diff --color=always -- {-1} | delta || " .
\ g:fzf_preview_command
