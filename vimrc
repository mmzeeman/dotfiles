set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/nerdtree'

" Status line stuff
Plugin 'itchyny/lightline.vim'
Plugin 'itchyny/vim-gitbranch'

" Git stuff
Plugin 'tpope/vim-fugitive.git'

" Tag stuff
Plugin 'majutsushi/tagbar'
Plugin 'ludovicchabant/vim-gutentags'

" Color stuff
" Plugin 'nightsense/snow'
" Plugin 'jeffkreeftmeijer/vim-dim'
" Plugin 'noahfrederick/vim-noctu'
Plugin 'mmzeeman/vim-hexac'
Plugin 'mmzeeman/nofrils'
" Plugin 'mmzeeman/vim-hexmin'
" Plugin 'robertmeta/nofrils'

" Try out vimwiki 
Plugin 'vimwiki/vimwiki'

call vundle#end()            " required

filetype plugin indent on    " required

" vimwiki/vimwiki
let g:vimwiki_list = [{'path': '~/Dropbox/wiki/', 'syntax': 'markdown', 'ext': '.md'}]

" Workaround for vim bug on terminals which don't support background color
" erase
let &t_ut=''

" set Vim-specific sequences for RGB colors
if has("termguicolors")
    set termguicolors
endif

if has("gui_running")
    if has("gui_macvim")
        :set macligatures
    endif

    :set guifont=PragmataPro\ Mono\ Liga:h11
    colorscheme snow
else
    " Uses the 16 color ansi scheme
    " colorscheme dim
    
    set background=light
    " set background=dark
    colorscheme nofrils-light

    " hi Normal ctermbg=NONE
    " hi nonText ctermbg=NONE

    " colorscheme hexmin 
endif

syntax enable

let g:NERDTreeNodeDelimiter = "\u00a0"

set expandtab
set shiftwidth=4
set tabstop=8

set incsearch
set hlsearch
set wrapscan
set scrolljump=5

set number
set ruler
set showmode
set showcmd
set mouse=a

set nobackup
set noswapfile

" Finding things
set path+=**
set wildmenu

" Clipboard 
set clipboard=unnamed 

"
"set laststatus=2
"set noshowmode

au BufRead,BufNewFile *.tpl set filetype=htmldjango

" Tweaks for file browsing
"let g:netrw_banner=0
"let g:netrw_browse_split=4
"let g:netrw_altv=1
"let g:netrw_liststyle=3

let mapleader=","

" NERDTree and Tagbar toggling
nmap <F8> :NERDTreeToggle<CR>
nmap <F9> :TagbarToggle<CR>

nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>t :TagbarToggle<CR>

nmap <leader>fc :NofrilsFocusCode<CR>
nmap <leader>fo :NofrilsFocusComments<CR>
nmap <leader>fn :NofrilsFocusNormal<CR>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

