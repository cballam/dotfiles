local u = require('utils')
local nnoremap = u.nnoremap
local tnoremap = u.tnoremap
local vnoremap = u.vnoremap

-- Normal remaps
nnoremap(';', 'l')
nnoremap('l', 'k')
nnoremap('k', 'j')
nnoremap('j', 'h')
vnoremap(';', 'l')
vnoremap('l', 'k')
vnoremap('k', 'j')
vnoremap('j', 'h')

nnoremap('<leader>j', '<C-w>h')
nnoremap('<leader>k', '<C-w>j')
nnoremap('<leader>l', '<C-w>k')
nnoremap('<leader>;', '<C-w>l')
nnoremap('<leader>J', '<C-w>H')
nnoremap('<leader>K', '<C-w>J')
nnoremap('<leader>L', '<C-w>K')
nnoremap('<leader>:', '<C-w>L')
-- LSP
nnoremap('gd', "<cmd> lua vim.lsp.buf.definition()<CR>")
nnoremap('gD', "<cmd> lua vim.lsp.buf.declaration()<CR>")
nnoremap('gr', "<cmd> lua vim.lsp.buf.references()<CR>")
nnoremap('gi', "<cmd> lua vim.lsp.buf.implementation()<CR>")
nnoremap('K', "<cmd> lua vim.lsp.buf.hover()<CR>")
nnoremap('<C-k>', "<cmd> lua vim.lsp.buf.signature_help()<CR>")
nnoremap('<C-n>', "<cmd> lua vim.lsp.buf.goto_prev()<CR>")
nnoremap('<C-p>', "<cmd> lua vim.lsp.buf.goto_next()<CR>")

-- Telescope
nnoremap('<C-b>', ":lua require'telescope.builtin'.buffers{}<CR>")
nnoremap('<C-g>', ":lua require'telescope.builtin'.git_files{}<CR>")
nnoremap('<C-f>', ":lua require'telescope.builtin'.find_files{}<CR>")
nnoremap('<leader>bt', ":lua require'telescope.builtin'.current_buffer_tags{}<CR>")
--nnoremap('<leader>t', ":lua require'telescope.builtin'.lsp_document_symbols{}<CR>")
nnoremap('<leader>b', ":lua require'telescope.builtin'.current_buffer_fuzzy_find{}<CR>")
nnoremap('<leader>s', ":lua require'telescope.builtin'.live_grep{}<CR>")
nnoremap('<leader>d', ":lua require'telescope.builtin'.diagnostics{}<CR>")
nnoremap('<leader>pp', ":lua require'telescope.builtin'.marks{}<CR>")

-- Terminal
nnoremap('<leader>ot', ':sp<CR>:resize 10<CR>:term<CR>')
tnoremap('<leader>j', "<C-\\><C-N><C-w>h")
tnoremap('<leader>k', "<C-\\><C-N><C-w>j")
tnoremap('<leader>l', "<C-\\><C-N><C-w>k")
tnoremap('<leader>;', "<C-\\><C-N><C-w>l")

-- Floatterm
nnoremap('<leader>ft', ':FloatermNew<CR>')
tnoremap('<leader>t', '<C-\\><C-n>:FloatermToggle<CR>')
nnoremap('<leader>t', ':FloatermToggle<CR>')

-- Symbols
nnoremap('<C-s>', ":SymbolsOutline<CR>")
