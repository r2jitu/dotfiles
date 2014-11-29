"""""""""""""""""
" Vundle config "
"""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" My plugins here:
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'Lokaltog/vim-powerline'
Plugin 'scrooloose/nerdtree'
Plugin 'wincent/command-t'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



"""""""""""""""""""""""""
" Jitu's customizations "
"""""""""""""""""""""""""

set ttymouse=xterm
set term=xterm
if $TERM == 'xterm-256color' || $TERM == 'screen-256color'
    set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
    colorscheme default
endif

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
set backspace=2
set expandtab
set smarttab

set tags=./tags;/

set colorcolumn=81,101
hi ColorColumn guibg=#2d2d2d ctermbg=235

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

" For Powerline
set laststatus=2
set encoding=utf-8

" Something was wrong with iTerm, SSH, and Vim
"set backspace=start,eol,indent

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

" NERDTree tabs
map <Leader>n <plug>NERDTreeTabsToggle<CR>

" Command-T cutomization
let s:cmdt_roots = []
au VimEnter * :let s:curdir = getcwd()
fu! <sid>CmdTDir()
    for root in s:cmdt_roots
        if match(s:curdir, root) >= 0
            return substitute(s:curdir, escape(root, '/') . '.*$', root, '')
        endif
    endfor
    return s:curdir
endfu
nnoremap <silent> <Leader>t :exe 'CommandT ' . <sid>CmdTDir()<CR>
