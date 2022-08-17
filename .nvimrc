set nocompatible
filetype off
"let mapleader=' '
let g:solarized_termcolors=256
"set background=dark
set path=.,**
"set spell spelllang=en
"set spellsuggest=best

hi Pmenu        ctermfg=LightGray         ctermbg=233         cterm=None
hi PmenuSel     ctermfg=DarkGray          ctermbg=232         cterm=Bold
hi PmenuSbar    ctermfg=247         ctermbg=233         cterm=Bold
hi PmenuThumb   ctermfg=248         ctermbg=233         cterm=None
" vanilla Vim
"set updatetime=300

set hidden
set cmdheight=2
set shortmess+=c
set incsearch
" Show modification of substitution command in split
set inccommand=split
"set wrap
"set tw=80
"
lua << EOF
vim.wo.number = true
vim.o.updatetime = 250
vim.g.mapleader = ' '
vim.o.background = 'dark'
vim.wo.relativenumber = true
vim.o.visualbell = false
EOF

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
"Plugin 'vim-airline/vim-airline'
Plugin 'nvim-lualine/lualine.nvim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
"Plugin 'neoclide/coc.nvim'
"Plugin 'antoinemadec/coc-fzf'
"Plugin 'neoclide/coc-snippets'
Plugin 'yuki-ycino/fzf-preview.vim'

Plugin 'nvim-lua/plenary.nvim'
"Plugin 'nvim-telescope/telescope.nvim'

Plugin 'neovim/nvim-lspconfig'
Plugin 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plugin 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plugin 'nvim-treesitter/nvim-treesitter'
Plugin 'nvim-treesitter/playground'

Plugin 'arcticicestudio/nord-vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'ap/vim-css-color'
Plugin 'liuchengxu/vista.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'akinsho/nvim-bufferline.lua'
Plugin 'kyazdani42/nvim-web-devicons'
Plugin 'NLKNguyen/papercolor-theme'

call vundle#end()

colorscheme PaperColor
hi Normal guibg=None ctermbg=None
"" LUA configs
lua <<EOF
require'lspconfig'.clangd.setup{
                cmd = { "/usr/bin/clangd", "--background-index", "--completion-style=detailed", "--clang-tidy"  }
            }
require'lspconfig'.pyright.setup{
  settings ={
    python = {
      venvPath = "/home/cole/.conda/envs/control",
      }
    }
}
require'lspconfig'.bashls.setup{}
require'lspconfig'.rls.setup{}
require'lspconfig'.tsserver.setup{}

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}
require("nvim-treesitter.install").prefer_git = true
require'lualine'.setup()
--local vim.g.coq_settings = {['auto_start'] : true | 'shut-up'}
vim.g.coq_settings = { ["auto_start"] = true }
EOF


" lsp-config bindings
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

filetype plugin indent on

" Potentially use vim-latex - has nice movement in latex files

syntax on
lua require'bufferline'.setup{}
"lua require'telescope'.setup{}

"set relativenumber
"set visualbell
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
nnoremap <leader>J <C-w>H
nnoremap <leader>K <C-w>J 
nnoremap <leader>L <C-w>K 
nnoremap <leader>: <C-w>L
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
nnoremap <C-b> :lua require'telescope.builtin'.buffers{}<CR>
nnoremap <C-g> :lua require'telescope.builtin'.git_files{}<CR>
nnoremap <C-f> :lua require'telescope.builtin'.find_files{}<CR>
"nnoremap <leader>g :CocCommand fzf-preview.GitStatus<CR>
" nnoremap <leader>t :Tags<CR>
nnoremap <leader>bt :lua require'telescope.builtin'.current_buffer_tags{}<cr>
nnoremap <leader>t :lua require'telescope.builtin'.lsp_document_symbols{}<CR>

nnoremap <leader>b :lua require'telescope.builtin'.current_buffer_fuzzy_find{}<CR>
" 'Search File' to look for lines with word under cursor
"nnoremap <leader>sf yiw:BLines <C-r><C-w><CR>

" More comfy bindings:
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)

" Rg bindings:
" In visual mode, use ctrl-s to yank the current word to a buffer and then use
" Rg to search for that word. Might look at <cword> for this in the future
"nnoremap <leader>s :Rg<CR> 
nnoremap <C-s> yiw:Rg <C-r><C-w><CR>
"vnoremap <C-s> <Esc>yiw:Rg <C-r><C-w><CR>

nnoremap <leader>s :lua require'telescope.builtin'.live_grep{}<CR>

" coc-fzf bindings
""nnoremap <silent> <leader>d :<C-u>CocFzfList diagnostics --current-buf<CR>
nnoremap <silent> <leader>d :lua require'telescope.builtin'.diagnostics{}<CR>
"" Basically show variables+functions. super useful
"nnoremap <silent> <leader>o :<C-u>CocFzfList outline --current-buf<CR> 
"" symbols, which is pretty cool
"inoremap <silent> <C-s> <C-c>:CocFzfList symbols<CR>

" fix the thing (if coc knows how)
nmap <leader>fc <Plug>(coc-fix-current)


" Telescope bindings
:nnoremap <Leader>pp :lua require'telescope.builtin'.marks{}<CR>

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

" Highlight the symbol and its references when holding the cursor.
"autocmd CursorHold * silent call CocActionAsync('highlight')

" K uses keywordprg, so set this to default to pydocs in .py files
autocmd BufNewFile,BufRead *.py set keywordprg=pydoc


" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" How can I do this with vim lsp? Seems interesting and somewhat reasonable
nnoremap <silent> <leader>od :set invsplitbelow<CR>:call CocAction('doHover', 'preview')<CR>:set invsplitbelow<CR>

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
nmap <F8> :Vista!!<CR>

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
