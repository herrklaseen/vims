set encoding=utf-8
set nocompatible               " be iMproved
filetype off                   " required!
set backspace=2
set backspace=indent,eol,start
set t_Co=256

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

set clipboard=unnamed

" Ignore these please
"
set wildignore+=*/dist/*,*/tmp/*,*/node_modules/*,**/compiled/*,**/www/*,*.swp,*.zip,*.exe

" let Vundle manage Vundle
" required! 
Plugin 'VundleVim/Vundle.vim'

" My Bundles here:
"
" original repos on github
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'flazz/vim-colorschemes'
Plugin 'w0rp/ale'

" vim-scripts repos
Plugin 'L9'
Plugin 'FuzzyFinder'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

colorscheme Tomorrow-Night
syntax enable

if &diff
  colorscheme monokai
endif

:set number
:let mapleader = ","
:set tabstop=8 softtabstop=4 shiftwidth=4 expandtab
" Make search case insensitive at startup
:set ignorecase

"
" MAPPINGS
"
:nnoremap <Leader>nt :NERDTreeToggle<CR>
" changes to tabs as spaces AKA 'spacetabs'
:nnoremap <Leader>st :set tabstop=8 softtabstop=4 shiftwidth=4 expandtab<CR>
" changes to tabs as spaces, 2 per tab, AKA 'spacetabs'
:nnoremap <Leader>st2 :set tabstop=8 softtabstop=2 shiftwidth=2 expandtab<CR>
" changes to tabs as tabs AKA 'realtabs'
:nnoremap <Leader>rt :set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab<CR>
:nnoremap <Leader>cdc :cd ~/Code<CR> :NERDTreeCWD<CR>
:nnoremap <Leader>j o<Esc>0Dk<CR>
:nnoremap <Leader>k O<Esc>0Dj<CR>
:nnoremap <Leader>cs :set ignorecase!<CR>

" window switching sanity
:nnoremap <C-h> <C-w>h
:nnoremap <C-j> <C-w>j
:nnoremap <C-k> <C-w>k
:nnoremap <C-l> <C-w>l

"
" END MAPPINGS
"

" Use dot command in visual mode
:xnoremap . :normal.<CR>

" whitespace hiliter
:set list lcs=trail:·,tab:›·

" more apparent active buffer
" does this work?
hi StatusLine   ctermfg=230  ctermbg=125  cterm=none gui=none

" and I want column numbers
set rulerformat=col\ %c
set ruler

" GUI
if has("gui_running")
  set guifont=Source\ Code\ Pro:h13
  set guioptions -=T
  set guioptions -=m
  set guioptions -=r
  set guioptions -=L
endif

" timing
:set tm=500

" autocommands
:au InsertEnter * set nolist
:au InsertLeave * set list
:au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
:au WinLeave * setlocal nocursorline

" linting
"
let g:ale_fixers = {
\   'javascript': ['eslint'],
\}
