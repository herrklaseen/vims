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
Plug 'flazz/vim-colorschemes'
Plug 'w0rp/ale'
Plug 'leafgarland/typescript-vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'rafi/awesome-vim-colorschemes'

" All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

colorscheme Tomorrow-Night
syntax enable

" Better error hightlighting from ALE
highlight ALEError ctermbg=53 guifg=#5f005f
highlight ALEErrorSign ctermbg=none ctermfg=139 guifg=#b294bb

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
:nnoremap <Leader>n :NERDTreeToggle<CR>
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
:nnoremap <Leader>ks :%s/\s\+$//e<CR>
:nnoremap <Leader>q :noh<CR>
:vnoremap <Leader>tosq :s/"/'/g<CR>
:nnoremap <Leader>jp :%!python -m json.tool<CR>

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

" linting
"
let g:ale_linters = {'html': [],
\   'typescript': ['tslint', 'tsserver', 'typecheck'],
\}
let g:ale_fixers = {
\   'javascript': ['eslint'],
\}

let g:UltiSnipsSnippetsDir="~/.config/nvim/UltiSnips"
