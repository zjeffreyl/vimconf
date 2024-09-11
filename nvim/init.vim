call plug#begin()

"Theme Plugins
Plug 'EdenEast/nightfox.nvim'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
Plug 'andreypopp/vim-colors-plain'
Plug 'rockerBOO/boo-colorscheme-nvim'

Plug 'goolord/alpha-nvim'
Plug 'preservim/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'stevearc/oil.nvim'
Plug 'ncm2/ncm2-bufword'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

"Status Line
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'

"Formatting
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-fugitive'
Plug 'ntpeters/vim-better-whitespace'
Plug 'nvim-treesitter/nvim-treesitter'

"Editor Plugins
"nvim cmp
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'dcampos/nvim-snippy'
Plug 'dcampos/cmp-snippy'
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'SmiteshP/nvim-navic'
Plug 'MunifTanjim/nui.nvim'
Plug 'SmiteshP/nvim-navbuddy'
Plug 'HampusHauffman/block.nvim'
Plug 'APZelos/blamer.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
call plug#end()

" ----------------------------------------------------------------------------
"
" Plugin options
" ----------------------------------------------------------------------------
lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = { enable = true }
}
local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = {
    "                                                     ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                     ",
}

-- Set menu


dashboard.section.buttons.val = {
    dashboard.button( "e", "  > New file" , ":ene <BAR> startinsert <CR>"),
    dashboard.button( "f", "⌕  > Find file", ":cd $HOME/projects/sandbox| Telescope find_files<CR>"),
    dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
    dashboard.button( "s", "  > Settings" , ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
    dashboard.button( "q", "   > Quit NVIM", ":qa<CR>"),
}
require'alpha'.setup(dashboard.opts)
EOF

set background=dark
colorscheme plain
set termguicolors

autocmd VimEnter * Alpha

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
lua << EOF
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.tabstop = 4
EOF
set shiftwidth=4
set ignorecase
set hidden
set wildmenu
set wildmode=longest:full,full
set list
set statusline+=%{FugitiveStatusline()}

filetype plugin on "nerdcommenter


" ----------------------------------------------------------------------------
" Key Mappings
" ----------------------------------------------------------------------------
nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
nmap <leader>ke :edit ~/.config/kitty/kitty.conf<cr>
imap jj <esc>
nmap <leader>nt :NERDTreeFocus<cr>

" ----------------------------------------------------------------------------
" Setup
" ----------------------------------------------------------------------------
lua << END
require('config')
END
