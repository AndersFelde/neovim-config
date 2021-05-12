call plug#begin('~/.config/nvim/autoload/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'ghifarit53/tokyonight-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'honza/vim-snippets'
Plug 'rbgrouleff/bclose.vim'
Plug 'pixelneo/vim-python-docstring'
Plug 'preservim/nerdcommenter'
Plug 'sbdchd/neoformat'
Plug 'lepture/vim-jinja'
Plug 'vim-python/python-syntax'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'tpope/vim-surround'
Plug 'kien/ctrlp.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'lilydjwg/colorizer'
Plug 'liuchengxu/vim-which-key'
Plug 'yuezk/vim-js'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
call plug#end()
