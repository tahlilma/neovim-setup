" Editor Settings
set encoding=utf-8
set number
syntax enable
set noswapfile
set cursorline
set scrolloff=1
set backspace=indent,eol,start
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix
let mapleader = ' '

" this will install vim-plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif

call plug#begin()

" here you'll add all the plugins needed
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'} " this is for auto complete, prettier and tslinting

let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier']  " list of CoC extensions needed

Plug 'jiangmiao/auto-pairs' "this will auto close ( [ {

" these two plugins will add highlighting and indenting to JSX and TSX files.
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'

" Themes & Syntax Highlighting & Airline
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'norcalli/nvim-colorizer.lua'

call plug#end()

" Termgui Colors
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

" NERDTree
let NERDTreeQuitOnOpen=1
let g:NERDTreeMinimalUI=1
let NERDTreeShowHidden=1
nmap <F2> : NERDTreeToggle<CR>

" Colorizer
lua require 'colorizer'.setup()

" ColorScheme
colorscheme spaceduck
set background=dark

" Airline Stuff
let g:airline_theme = 'spaceduck'
let g:airline#extensions#tabinline#enabled=1
let g:airline#extensions#tabline#fnamemode=':t'
nmap <leader>1 :bp<CR>
nmap <leader>2 :bn<CR>
nmap <C-w> :bd<CR>
