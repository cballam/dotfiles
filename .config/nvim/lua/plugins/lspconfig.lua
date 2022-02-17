local nvim_lsp = require('lspconfig')

nvim_lsp.clangd.setup{
   cmd = { "/usr/bin/clangd", "--background-index", "--completion-style=detailed", "--clang-tidy"  }
}

nvim_lsp.pyright.setup{
   settings = {
      python = {
         venvPath = "/home/cole/.conda/envs/control",
      }
   }
}

nvim_lsp.bashls.setup{}
nvim_lsp.rls.setup{}
nvim_lsp.tsserver.setup{}

