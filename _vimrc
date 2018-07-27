set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

Plug 'gmarik/vundle'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Lokaltog/vim-easymotion'
Plug 'kien/ctrlp.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'wavded/vim-stylus'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'leafo/moonscript-vim'
Plug 'tikhomirov/vim-glsl'
Plug 'arcticicestudio/nord-vim'
Plug 'cocopon/iceberg.vim'
Plug 'mattn/emmet-vim'
Plug 'zah/nim.vim'

call plug#end()

filetype plugin indent on

set history=1000

let mapleader = ","
let g:mapleader = ","
let g:EasyMotion_do_mapping = 0
let g:NERDTreeCopyCmd="cp -r"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#wordcount#enabled = 0
let g:airline_theme='iceberg'
let g:ctrlp_root_markers = ['.ctrlp']
let g:tagbar_ctags_bin = 'C:\Users\gen\ctags.exe'

nmap <leader>w :w<CR>
nmap <leader>q :q<CR>
nmap <leader>f :CtrlP<CR>
nmap <leader>os :OpenSession<CR>
nmap s <Plug>(easymotion-bd-w)
nmap <F8> :TagbarToggle<CR>

set autoread

set langmenu=en_US.UTF-8
set wildmenu
set wildignore=*.o,*~
set number
set ruler
set hid
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set relativenumber 
set nocursorline
set ignorecase
set smartcase
set incsearch
set magic
set showmatch
set mat=2
set autochdir
set guicursor=a:block-Cursor/lCursor
set guicursor+=a:blinkon0
set guioptions=""
set guifont=Consolas:h13
set encoding=utf8
set nobackup
set nowb
set noswapfile
set foldmethod=marker

syntax enable
colorscheme iceberg

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set ai
set si
set wrap

noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-g> <C-W>h
noremap <C-i> <C-W>l
map <C-h> :bp<CR>
map <C-l> :bn<CR>
map <C-w> :bd<CR>

nmap <M-1> <Plug>AirlineSelectTab1
nmap <M-2> <Plug>AirlineSelectTab2
nmap <M-3> <Plug>AirlineSelectTab3
nmap <M-4> <Plug>AirlineSelectTab4
nmap <M-5> <Plug>AirlineSelectTab5
nmap <M-6> <Plug>AirlineSelectTab6
nmap <M-7> <Plug>AirlineSelectTab7
nmap <M-8> <Plug>AirlineSelectTab8
nmap <M-9> <Plug>AirlineSelectTab9

nnoremap <silent> <F2> :NERDTree<CR>
nnoremap <space> za

cd ~/Desktop/dev
autocmd VimEnter * IndentGuidesEnable
