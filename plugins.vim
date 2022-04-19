" vim-plug installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(stdpath('data') . '/plugged')

" golang
"Plug 'Shougo/deoppet.nvim', { 'do': ':UpdateRemotePlugins'}
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' , 'tag': '*'}
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'puremourning/vimspector', { 'do': ':VimspectorInstall' }

" rust
Plug 'neovim/nvim-lspconfig'
Plug 'simrat39/rust-tools.nvim'

" Debugging
Plug 'nvim-lua/plenary.nvim'
Plug 'mfussenegger/nvim-dap'

" toml
Plug 'cespare/vim-toml', { 'branch': 'main' }

" pest
Plug 'pest-parser/pest.vim'

" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" ale
Plug 'dense-analysis/ale'

Plug 'Pocco81/DAPInstall.nvim'

call plug#end()
