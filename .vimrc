set encoding=utf-8
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

set clipboard=unnamed

" let Vundle manage Vundle
" required! 
Plugin 'VundleVim/Vundle.vim'

" My Bundles here:
"
" original repos on github
Plugin 'blueyed/vim-colors-solarized'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'cakebaker/scss-syntax.vim'

" vim-scripts repos
Plugin 'L9'
Plugin 'FuzzyFinder'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Solarized stuff
colorscheme solarized
syntax enable
set background=light

:set number
:let mapleader = ","
:set tabstop=8 softtabstop=2 shiftwidth=2 expandtab

" mappings
"
:nnoremap <Leader>nt :NERDTreeToggle<CR>
:nnoremap <Leader>st :set tabstop=8 softtabstop=2 shiftwidth=2 expandtab<CR>
:nnoremap <Leader>rt :set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab<CR>
:nnoremap <Leader>j o<Esc>0Dk<CR>
:nnoremap <Leader>k O<Esc>0Dj<CR>

" window switching sanity
"
:nnoremap <C-h> <C-w>h
:nnoremap <C-j> <C-w>j
:nnoremap <C-k> <C-w>k
:nnoremap <C-l> <C-w>l

" Use dot command in visual mode

:xnoremap . :normal.<CR>

" function to switch light and dark background
call togglebg#map("<F5>")

" whitespace hiliter
:set list lcs=trail:·,tab:›·

" more apparent active buffer
hi StatusLine   ctermfg=230  ctermbg=125  cterm=none gui=none

" and I want column numbers
set rulerformat=col\ %c
set ruler

" font selection for GUI
set guifont=Source\ Code\ Pro:h13

" timing
:set tm=500

" autocommands
:au InsertEnter * set nolist
:au InsertLeave * set list
:au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
:au WinLeave * setlocal nocursorline
