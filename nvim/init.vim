call plug#begin()

"Theme Plugins
Plug 'norcalli/nvim-colorizer.lua'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'svermeulen/text-to-colorscheme.nvim'

Plug 'preservim/nerdcommenter'
Plug 'scrooloose/nerdtree'
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
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'SmiteshP/nvim-navic'
Plug 'MunifTanjim/nui.nvim'
Plug 'SmiteshP/nvim-navbuddy'
Plug 'HampusHauffman/block.nvim'
Plug 'APZelos/blamer.nvim'
Plug 'mfussenegger/nvim-dap'

"Configure tbd
call plug#end()

set termguicolors
colorscheme catppuccin-macchiato
lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = { enable = true }
}

vim.api.nvim_create_autocmd({ 'ColorScheme', 'FileType' }, {
  callback = function ()
    vim.cmd([[
      hi IndentBlanklineChar gui=nocombine guifg=#444C55
      hi IndentBlanklineSpaceChar gui=nocombine guifg=#444C55
      hi IndentBlanklineContextChar gui=nocombine guifg=#d3290f
      hi IndentBlanklineContextStart gui=underline guisp=#d3290f
    ]])
  end,
})

EOF

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
"set expandtab
"set shiftwidth=4
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
