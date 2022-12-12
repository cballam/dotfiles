-- From LunarVim's packer setup
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  use "wbthomason/packer.nvim"
  use "nvim-lua/plenary.nvim"
  use "nvim-lualine/lualine.nvim"
  use "kyazdani42/nvim-web-devicons"
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}

  -- LSP
  use {"williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim"
  }
  use "neovim/nvim-lspconfig" -- enable LSP
  use {"sheerun/vim-polyglot", commit='2c5af8f89d3e61e04e761c07a1f043b0f35203c6'} -- Has to hardcode to functional commit, vim9 additions screw up neovim
  --use "williamboman/nvim-lsp-installer"

  -- Autocomplete + snippets
  use "ms-jpq/coq_nvim"
  use "ms-jpq/coq.artifacts"

  -- Telescope
  use "nvim-telescope/telescope.nvim"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "nvim-treesitter/playground"

  use "voldikss/vim-floaterm"
  use "simrat39/symbols-outline.nvim"

  use "NLKNguyen/papercolor-theme"

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
