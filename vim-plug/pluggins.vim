call plug#begin('~/.config/nvim/autoload/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive' "GIT
Plug 'jiangmiao/auto-pairs'
Plug 'honza/vim-snippets'
Plug 'pixelneo/vim-python-docstring'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'liuchengxu/vim-which-key'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

"themes
Plug 'ghifarit53/tokyonight-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"window handling
Plug 'rbgrouleff/bclose.vim'

"linting
Plug 'sbdchd/neoformat'

"Syntax highlighter
Plug 'yuezk/vim-js'
Plug 'lilydjwg/colorizer'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'vim-python/python-syntax'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'lepture/vim-jinja'

" Indentation
Plug 'Yggdroot/indentLine'
Plug 'lukas-reineke/indent-blankline.nvim'

" Dashboard
Plug 'glepnir/dashboard-nvim'
" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'kqito/vim-easy-replace' "Search and replace

" Plug 'kien/ctrlp.vim'
call plug#end()
