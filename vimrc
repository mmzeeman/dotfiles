set nocompatible              " be iMproved, required
filetype off                  " required

filetype plugin indent on    " required

" vimwiki/vimwiki
" let g:vimwiki_list = [{'path': '~/Dropbox/wiki/', 'syntax': 'markdown', 'ext': '.md'}]

" Workaround for vim bug on terminals which don't support background color erase
" let &t_ut=''

set background=light
" set background=dark

if has("termguicolors")
  set termguicolors
endif

" colorscheme nofrils-light
colorscheme highlight-zebra-gentle
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


function! ErlangTag()
    " Get the current line and cursor position
    let line = getline('.')
    let col = col('.')
    
    " Try to find module:function pattern around cursor
    let pattern = '\v<\w+:\w+>'
    let match_start = match(line, pattern)
    let keyword = ''
    
    while match_start != -1
        let match_end = matchend(line, pattern, match_start)
        if match_start < col && col <= match_end
            let keyword = matchstr(line, pattern, match_start)
            break
        endif
        let match_start = match(line, pattern, match_end)
    endwhile
    
    " If no module:function found, get just the word under cursor
    if empty(keyword)
        let keyword = expand('<cword>')
    endif
    
    " Parse and jump to tag
    let parts = split(keyword, ':')
    if len(parts) == 1
        execute 'tag' keyword
    elseif len(parts) == 2
        let [mod, fun] = parts
        let i = 1
        let fun_taglist = taglist('^' . fun . '$')
        for item in fun_taglist
           if item.kind == 'f' && item.module == mod
               silent execute i . 'tag' fnameescape(item.name)
               break
           endif
           let i += 1
        endfor
    endif
endfunction

autocmd FileType erlang nnoremap <buffer> <C-]> :call ErlangTag()<CR>

