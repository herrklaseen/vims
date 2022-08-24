"set encoding=utf-8
"filetype off                   " required!
"set backspace=2
"set backspace=indent,eol,start
"set t_Co=256

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" Ignore these please
"
set wildignore+=*/dist/*,*/tmp/*,*/node_modules/*,**/compiled/*,**/www/*,*.swp,*.zip,*.exe

" My Bundles here:
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'flazz/vim-colorschemes'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

set termguicolors
colorscheme gruvbox
syntax enable

if exists("*ToggleBackground") == 0
  function ToggleBackground()
    if &background == "dark"
      set background=light
    else
      set background=dark
    endif
  endfunction

  command BG call ToggleBackground()
endif


let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]

if &diff
  colorscheme monokai
endif

:set number
:let mapleader = ","
:set tabstop=8 softtabstop=2 shiftwidth=2 expandtab
" Make search case insensitive at startup
:set ignorecase

"
" MAPPINGS
"
:nnoremap <Leader>n :NERDTreeToggle<CR>
" changes to tabs as spaces AKA 'spacetabs'
:nnoremap <Leader>st :set tabstop=8 softtabstop=4 shiftwidth=4 expandtab<CR>
" changes to tabs as spaces, 2 per tab, AKA 'spacetabs'
:nnoremap <Leader>st2 :set tabstop=8 softtabstop=2 shiftwidth=2 expandtab<CR>
" changes to tabs as tabs AKA 'realtabs'
:nnoremap <Leader>rt :set tabstop=3 softtabstop=3 shiftwidth=3 noexpandtab<CR>
:nnoremap <Leader>cdc :cd ~/Code<CR> :NERDTreeCWD<CR>
:nnoremap <Leader>j o<Esc>0Dk<CR>
:nnoremap <Leader>k O<Esc>0Dj<CR>
:nnoremap <Leader>cs :set ignorecase!<CR>
:nnoremap <Leader>ks :%s/\s\+$//e<CR>
:nnoremap <Leader>q :noh<CR>
:vnoremap <Leader>tosq :s/"/'/g<CR>
:nnoremap <Leader>jp :%!python -m json.tool<CR>
:nnoremap <Leader>af :ALEFix<CR>
:nnoremap <F5> :BG<CR>

" window switching sanity
:nnoremap <C-h> <C-w>h
:nnoremap <C-j> <C-w>j
:nnoremap <C-k> <C-w>k
:nnoremap <C-l> <C-w>l

" window widths
:nnoremap <Leader>vi :vertical resize +10<CR>
:nnoremap <Leader>vd :vertical resize -10<CR>


" NerdTree
let NERDTreeQuitOnOpen = 1
let g:NERDTreeWinSizeMax = 65
"
" END MAPPINGS
"

" Use dot command in visual mode
:xnoremap . :normal.<CR>

" whitespace hiliter
:set list lcs=trail:·,tab:›·

" more apparent active buffer
hi StatusLine   ctermfg=230  ctermbg=125  cterm=none gui=none

" and I want column numbers
set rulerformat=col\ %c
set ruler

" timing
:set tm=500

" autocommands
:au InsertEnter * set nolist
:au InsertLeave * set list
:au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
:au WinLeave * setlocal nocursorline
" Experiment with NerdTree on enter
":au VimEnter * :NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd q | exe 'cd '.argv()[0] | endif

:set backupcopy=yes
