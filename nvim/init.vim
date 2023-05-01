call plug#begin()

"Theme Plugins
Plug 'sainnhe/everforest'
Plug 'arcticicestudio/nord-vim'
Plug 'arzg/vim-colors-xcode'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'norcalli/nvim-colorizer.lua'
Plug 'Mofiqul/dracula.nvim'
Plug 'rebelot/kanagawa.nvim'

Plug 'preservim/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'ncm2/ncm2-bufword'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

"Status Line
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

"Formatting
Plug 'tpope/vim-sleuth'
Plug 'ntpeters/vim-better-whitespace'
Plug 'nvim-treesitter/nvim-treesitter'

"Editor Plugins
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'SmiteshP/nvim-navic'
Plug 'MunifTanjim/nui.nvim'
Plug 'SmiteshP/nvim-navbuddy'

"Configure tbd
call plug#end()

if has('termguicolors')
    set termguicolors
endif
"set background=dark
"let g:everforest_background='medium'
"let g:everforest_better_performance = 1
"let g:everforest_background_opacity = 0.5
colorscheme kanagawa

let mapleader = "\<space>"
" ----------------------------------------------------------------------------
" Plugin options
" ----------------------------------------------------------------------------
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fs :lua require'telescope.builtin'.lsp_document_symbols{}<cr>
nnoremap <Leader>g0 :lua require'telescope.builtin'.lsp_references{}<cr>

" ----------------------------------------------------------------------------
" General settings
" ----------------------------------------------------------------------------
set expandtab
set shiftwidth=4
set ignorecase
set hidden
set number
set wildmenu
set wildmode=longest:full,full
set list

" ----------------------------------------------------------------------------
" Key Mappings
" ----------------------------------------------------------------------------
nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
imap jj <esc>
nmap <leader>nt :NERDTreeFocus<cr>

" ----------------------------------------------------------------------------
" Setup
" ----------------------------------------------------------------------------

" Status line
lua << END
require('config')
END
