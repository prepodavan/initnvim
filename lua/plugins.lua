local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({
    'git',
    'clone',
    '--depth',
    '1', 
    'https://github.com/wbthomason/packer.nvim', 
    install_path,
  })
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use {'wbthomason/packer.nvim', opt = true}
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require("bufferline").setup{} end, 
  }
  use { 
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require('nvim-tree').setup{} end, 
  }
  use {
    'nvim-telescope/telescope.nvim', 
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function() require('telescope').setup{} end, 
  }

  use 'mfussenegger/nvim-dap'
  use 'nvim-treesitter/nvim-treesitter'
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/cmp-path'
  -- use 'L3MON4D3/LuaSnip'

  use 'powerman/vim-plugin-ruscmd'
  
  -- ]p - insert on above line, [p - below
  -- use 'tpope/vim-unimpaired'

  use 'nvim-lua/popup.nvim'

  -- surrounds block with text
  use 'tpope/vim-surround'
  -- repeat through surround
  -- use 'tpope/vim-repeat'
  use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end }
  -- closes braces automaticaly 
  use 'cohama/lexima.vim'

  use 'ray-x/go.nvim'

  use 'cespare/vim-toml'
  use 'pest-parser/pest.vim f'

  use 'simrat39/rust-tools.nvim'

  
end)
