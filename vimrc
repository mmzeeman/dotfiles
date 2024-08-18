set nocompatible              " be iMproved, required
filetype off                  " required

filetype plugin indent on    " required

" vimwiki/vimwiki
let g:vimwiki_list = [{'path': '~/Dropbox/wiki/', 'syntax': 'markdown', 'ext': '.md'}]

" Workaround for vim bug on terminals which don't support background color erase
let &t_ut=''

set background=light
" set background=dark

colorscheme nofrils-light

syntax enable

" let g:NERDTreeNodeDelimiter = "\u00a0"
let g:NERDTreeHighlightCursorline = 0

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

