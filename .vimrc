set nocompatible

set ttymouse=xterm
set term=xterm
if $TERM == 'xterm-256color' || $TERM == 'screen-256color'
    set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
    "colorscheme wombat256
    colorscheme default
endif

call pathogen#infect()

set mouse=a
set number
set ruler
if exists('+autochdir')
  set autochdir
endif

syntax on
set hlsearch

set autoindent
set smartindent

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab

"highlight ExtraWhitespace ctermbg=red guibg=red
"match ExtraWhitespace /\s\+$/

set tags=./tags;/

if exists('+colorcolumn')
  set colorcolumn=81,101
  hi ColorColumn guibg=#2d2d2d ctermbg=235
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>81v.\+', -1)
endif

au BufNewFile,BufRead *.cu set ft=cpp
au BufNewFile,BufRead *.cu_inl set ft=cpp
au BufNewFile,BufRead *.glsl set ft=cpp
au BufNewFile,BufRead *.ispc set ft=cpp

au BufNewFile,BufRead *.go set filetype=go
au BufNewFile,BufRead *.soy set filetype=soy
au BufNewFile,BufRead *.gss set filetype=css
au BufNewFile,BufRead *.proto set filetype=proto

au BufRead,BufNewFile *.dats set filetype=ats 
au BufRead,BufNewFile *.sats set filetype=ats 

au BufNewFile,BufRead *.l1 set filetype=c
au BufNewFile,BufRead *.l2 set filetype=c
au BufNewFile,BufRead *.l3 set filetype=c
au BufNewFile,BufRead *.l4 set filetype=c
au BufNewFile,BufRead *.l5 set filetype=c
au BufNewFile,BufRead *.l6 set filetype=c

set laststatus=2
set encoding=utf-8

" Something was wrong with iTerm, SSH, and Vim
set backspace=start,eol,indent

" Some mappings
"imap <C-h> <Left>
"imap <C-j> <Down>
"imap <C-k> <Up>
"imap <C-l> <Right>
"imap <C-w> <C-o>w
"imap <C-e> <C-o>e
"imap <C-b> <C-o>b
"imap <C-u> <C-o>u
"imap <C-r> <C-o>r

" Trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

