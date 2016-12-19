""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Init.vim: Marco Herrero <me@marhs.de>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" THIS IS A CACTUS
"
"        |_|_|
"      \_|||;;_/
"     \d|||||;:b/
"    \d||#H#|;::b/
"  ._H||#H#|||;::H_.   
"  ._H||#H#|||;::H_.
"  ._H||#H#|||;::H_.
"  ._?|||#||||;::P_.
"   ._H|||||||;:H_.
"   ._?||||||;::P_.
"    ._H|||||;:H_.
"    ._H|||||;:H_.
" .=================.
" |_________________|
"  |               |
"   |             |
"   |             |
"    |           |
"    |           |
"     |_________|
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

    " Git
    Plug 'tpope/vim-fugitive'
    " Completion
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'zchee/deoplete-jedi'
    " Motions
    Plug 'easymotion/vim-easymotion'
    " File finder
    Plug 'ctrlpvim/ctrlp.vim'
    " Lint & checker
    Plug 'neomake/neomake'
    " Training
    Plug 'takac/vim-hardtime'
    "Tags
    Plug 'majutsushi/tagbar'

    " Aesthetics
    Plug 'vim-airline/vim-airline'
    " Colorschemes
    Plug 'frankier/neovim-colors-solarized-truecolor-only/'
    Plug 'NLKNguyen/papercolor-theme'
    " Plug 'chriskempson/base16-vim'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Aesthetics
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
set termguicolors
colorscheme PaperColor

if has("gui_vimr")
" VimR specific settings like
"   color xyz
endif

set linespace=-2

" Airline
let g:airline_powerline_fonts = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basics
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on

set hidden
set history=10000

" Tab & Indent
set expandtab
set autoindent

set laststatus=2              " Windows always have status bars
set encoding=utf-8
set number
set relativenumber
set scrolloff=5
set showcmd                   " Show commands in last line
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ruler
set backspace=indent,eol,start
set undofile                  " Save undo actions to a file

" Case
set ignorecase
set smartcase

" Search
set incsearch
set showmatch
set hlsearch

" Files and backup
set nobackup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set noswapfile
set nowritebackup
set autoread

"set wrap
set colorcolumn=120

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python specific
" TODO Move these to another file
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Folds
set foldmethod=indent
set foldnestmax=3
set foldlevel=99

" Tabs = 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PERSONAL KEYMAPS (Be careful in your workflow with these)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader remap to space
let mapleader = "\<Space>"

" Open .vimrc in a new tab with <Leader>vr
nmap <Leader>vr :tabe ~/.config/nvim/init.vim<cr>

" Search the selection in visual mode
vnoremap * y/<C-R>"<CR>

" Save a file:
nnoremap <Leader>w :w<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" INDENT if I'm writing a word, else do COMPLETION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fugitive
" <leader> g*
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader>gd :Gvdiff<CR>
nmap <Leader>gc :Gcommit<CR>
nmap <Leader>gw :Gwrite<CR>
nmap <Leader>gr :Gread<CR>
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gb :Gblame<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Easymotion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<C-p>'
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_match_window_reversed = 1
let g:ctrlp_custom_ignore = '\v\$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0

nnoremap <Leader>p :CtrlPBufTag<CR>
nmap <Leader>bb :CtrlPBuffer<cr>
nmap <Leader>bm :CtrlPMixed<cr>
nmap <Leader>bs :CtrlPMRU<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Deoplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar
" <leader> tb
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
nnoremap <Leader>t :TagbarToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Neomake
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd BufWritePost * Neomake

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Windows movement (Alt-hjkl) for normal and terminal
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TODO Autoload vimrc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
