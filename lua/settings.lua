vim.g.mapleader = " "
vim.cmd("set termguicolors") -- For color highlighting
vim.cmd("syntax enable") -- Enables syntax highlighing
vim.cmd("set hidden") -- Required to keep multiple buffers open multiple buffers
vim.cmd("set nowrap") -- Display long lines as just one line
vim.cmd("set encoding=utf-8") -- The encoding displayed
vim.cmd("set pumheight=10") -- Makes popup menu smaller
vim.cmd("set fileencoding=utf-8") -- The encoding written to file
vim.cmd("set ruler") -- Show the cursor position all the time
vim.cmd("set cmdheight=2") -- More space for displaying messages
vim.cmd("set iskeyword+=-") -- treat dash separated words as a word text object--
vim.cmd("set mouse=a") -- Enable your mouse
vim.cmd("set splitbelow") -- Horizontal splits will automatically be below
vim.cmd("set splitright") -- Vertical splits will automatically be to the right
vim.cmd("set t_Co=256") -- Support 256 colors
vim.cmd("set conceallevel=0") -- So that I can see `` in markdown files
vim.cmd("set tabstop=4") -- Insert 4 spaces for a tab
vim.cmd("set shiftwidth=4") -- Change the number of space characters inserted for indentation
vim.cmd("set smarttab") -- Makes tabbing smarter will realize you have 2 vs 4
vim.cmd("set expandtab") -- Converts tabs to spaces
vim.cmd("set smartindent") -- Makes indenting smart
vim.cmd("set autoindent") -- Good auto indent
--vim.cmd('set laststatus=1')                        -- Always display the status line
vim.cmd("set cursorline") -- Enable highlighting of the current line
vim.cmd("set background=dark") -- tell vim what the background color looks like
vim.cmd("set showtabline=2") -- Always show tabs
vim.cmd("set noshowmode") -- We don't need to see things like -- INSERT -- anymore
-- vim.cmd('set nobackup')                            -- This is recommended by coc
-- vim.cmd('set nowritebackup')                       -- This is recommended by coc
vim.cmd("set updatetime=300") -- Faster completion
vim.cmd("set timeoutlen=300") -- By default timeoutlen is 1000 ms
-- vim.cmd("set formatoptions-=cro") -- Stop newline continution of comments
vim.cmd("set clipboard=unnamedplus") -- Copy paste between vim and everything else
vim.cmd("set number relativenumber")
vim.cmd("filetype plugin on")

vim.cmd([[autocmd FileType * set formatoptions-=o]])
--commentary
vim.g.kommentary_create_default_mappings = false

-- compe
vim.o.completeopt = "menuone,noselect"
