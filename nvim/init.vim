autocmd VimEnter * NERDTree
" ----------------------------------------------------------------------------
" Plugins 
" ----------------------------------------------------------------------------
call plug#begin()
Plug 'arcticicestudio/nord-vim'
Plug 'preservim/nerdcommenter'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'phpactor/ncm2-phpactor'
call plug#end()
colorscheme nord

" ----------------------------------------------------------------------------
" Plugin options 
" ----------------------------------------------------------------------------
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

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
set omnifunc=phpcomplete#CompletePHP

" ----------------------------------------------------------------------------
" Key Mappings
" ----------------------------------------------------------------------------

let mapleader = "\<space>"

nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
imap jj <esc>
nmap <leader>nt :NERDTreeFocus<cr>
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
