set nocompatible
filetype off

call plug#begin('~/vimfiles/plugged')

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
Plug 'SirVer/UltiSnips'
Plug 'tikhomirov/vim-glsl'
Plug 'junegunn/vim-easy-align'
Plug 'tbastos/vim-lua'
Plug 'morhetz/gruvbox'

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
let g:airline_theme='gruvbox'
let g:ctrlp_root_markers = ['.ctrlp']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>" 
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories = ['~/vimfiles/UltiSnips', 'UltiSnips']
let g:vaxe_skip_hxml = 1
let g:indent_guides_start_level = 2

nmap <leader>w :w<CR>
nmap <leader>q :q<CR>
nmap <leader>f :CtrlP<CR>
nmap s <Plug>(easymotion-bd-w)
nmap <F8> :TagbarToggle<CR>
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

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
set guifont=Consolas:h10
set encoding=utf8
set nobackup
set nowb
set noswapfile
set foldmethod=marker
set background=dark
set listchars=eol:¬
set list

syntax enable
colorscheme gruvbox 

set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set smarttab
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
nmap <F3> $a<Space>[<C-R>=strftime("%d/%m/%y %H:%M:%S")<CR>]<ESC>

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

cd E:/Projects
autocmd VimEnter * IndentGuidesEnable
autocmd FileType moon setlocal shiftwidth=2 tabstop=2
