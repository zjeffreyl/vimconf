call plug#begin()

"Theme Plugins
Plug 'sainnhe/everforest'
Plug 'arcticicestudio/nord-vim'
Plug 'arzg/vim-colors-xcode'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'norcalli/nvim-colorizer.lua'
Plug 'Mofiqul/dracula.nvim'

Plug 'preservim/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'ncm2/ncm2-bufword'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

"Status Line
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'SmiteshP/nvim-navic'
Plug 'MunifTanjim/nui.nvim'

"Formatting
Plug 'tpope/vim-sleuth'
Plug 'ntpeters/vim-better-whitespace'
Plug 'nvim-treesitter/nvim-treesitter'

"Editor Plugins
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
"Configure tbd
Plug 'SmiteshP/nvim-navbuddy'
call plug#end()

if has('termguicolors')
    set termguicolors
endif
"set background=dark
"let g:everforest_background='medium'
"let g:everforest_better_performance = 1
"let g:everforest_background_opacity = 0.5
let g:xcodedark_green_comments = 1
colorscheme dracula
"colorscheme tokyonight-storm

let mapleader = "\<space>"
" ----------------------------------------------------------------------------
" Plugin options
" ----------------------------------------------------------------------------
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>

" ----------------------------------------------------------------------------
" General settings
" ----------------------------------------------------------------------------
"set expandtab
"set shiftwidth=4
set ignorecase
set hidden
set number
set wildmenu
set wildmode=longest:full,full
set list
set omnifunc=phpcomplete#CompletePHP
set foldmethod=indent
set fillchars+=vert:\

augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END

" ----------------------------------------------------------------------------
" Key Mappings
" ----------------------------------------------------------------------------
nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
imap jj <esc>
nmap <leader>nt :NERDTreeFocus<cr>
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>

" ----------------------------------------------------------------------------
" Setup
" ----------------------------------------------------------------------------

" Status line
lua << END
require('config')
END
