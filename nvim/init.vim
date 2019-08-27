"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" init.vim / .vimrc: Marco Herrero <me@marhs.de>
"  (neovim / vim 8)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" First, take a deep breath and enjoy this cactus
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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

    " Git
    Plug 'tpope/vim-fugitive'

    " Completion
    "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    "Plug 'zchee/deoplete-jedi'
    "
    "let g:deoplete#enable_at_startup = 1
    Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}

    " Power ranger motions
    Plug 'easymotion/vim-easymotion'

    " Code navigation (fzf)
    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf.vim'

    " Lint & checker
    Plug 'neomake/neomake'
    let g:neomake_python_enabled_makers = ['flake8']

    " Aesthetics
    Plug 'vim-airline/vim-airline'
    Plug 'machakann/vim-highlightedyank'

    " Colorschemes
    Plug 'frankier/neovim-colors-solarized-truecolor-only/'
    Plug 'NLKNguyen/papercolor-theme'
    Plug 'yous/vim-open-color'
    Plug 'chriskempson/base16-vim'

    " Activate only for projects
    Plug 'davidhalter/jedi-vim'
    Plug 'lervag/vimtex'
    Plug 'tpope/vim-surround'
    Plug 'editorconfig/editorconfig-vim'


    Plug 'ntpeters/vim-better-whitespace'
    Plug 'junegunn/vim-peekaboo'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Aesthetics
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
set termguicolors
colorscheme PaperColor

if has("gui_vimr")
" VimR specific settings like
"   color xyz
endif

set linespace=10

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0
let g:airline_left_sep = ''
let g:airline_right_sep = ''

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basics
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on

set hidden
set history=10000

" Tab & Indent
set expandtab
set autoindent

set laststatus=2              " Windows always have status bars
set encoding=utf-8
set number
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
"set incsearch
"set showmatch
"set hlsearch
set gdefault 
set inccommand=nosplit 

" Files and backup
set nobackup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set noswapfile
set nowritebackup
set autoread

"set wrap
set colorcolumn=72,80,120

set splitbelow
set splitright

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python specific
" TODO Move these to another file
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Folds
set foldmethod=indent
set foldnestmax=3
set foldlevel=99

" Tabs = 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PERSONAL KEYMAPS (Be careful in your workflow with these)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader remap to space
let mapleader = "\<Space>"

" Open .vimrc in a new tab with <Leader>vr
nmap <Leader>vr :tabe ~/.config/nvim/init.vim<cr>

" Search the selection in visual mode
vnoremap * y/<C-R>"<CR>

" Save a file:
nnoremap <Leader>w :w<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" INDENT if I'm writing a word, else do COMPLETION
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fugitive
" <leader> g*
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader>gd :Gvdiff<CR>
nmap <Leader>gc :Gcommit<CR>
nmap <Leader>gw :Gwrite<CR>
nmap <Leader>gr :Gread<CR>
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gb :Gblame<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Easymotion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fzf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <C-p> :FZF<CR>
nmap <Leader>t :Tags<CR>
nmap <Leader>b :Buffers<CR>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'up': '~30%' }

let g:fzf_buffers_jump = 1
let g:fzf_tags_command = 'ctags'

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header': ['fg', 'Comment'] }

let $FZF_DEFAULT_COMMAND = 'ag -g ""'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Deoplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Neomake
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufWritePost * Neomake

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Windows movement (Alt-hjkl) for normal and terminal
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufWinEnter,WinEnter term://* startinsert

tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Macros
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ipdb
let @p = 'Oimport ipdb; ipdb.set_trace()'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FIXME 
"   -> Autoload this file on write
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
