"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" init.vim / .vimrc: Marco Herrero <me@marhs.de>
"  (neovim / vim 8)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" This is going to be long, so first take a deep breath and 
" enjoy this cactus
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
"    |___________|
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

    " Git
    Plug 'tpope/vim-fugitive'

    " Plug 'mfussenegger/nvim-lint'
    Plug 'mfussenegger/nvim-lint'

    " lsp
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/cmp-nvim-lsp'

    " completion
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'

    " snippets
    Plug 'L3MON4D3/LuaSnip'
    Plug 'saadparwaiz1/cmp_luasnip'

    " Aesthetics
    Plug 'NLKNguyen/papercolor-theme'
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'kyazdani42/nvim-web-devicons'

    " quickfix list
    Plug 'folke/trouble.nvim'

    " Code navigation (fzf)
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    " Treesitter
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    Plug 'ggandor/lightspeed.nvim'
    Plug 'tpope/vim-repeat'

    Plug 'preservim/tagbar'
    Plug 'ntpeters/vim-better-whitespace'

    Plug 'Olical/conjure'
    Plug 'clojure-vim/vim-jack-in'
    Plug 'radenling/vim-dispatch-neovim'
    Plug 'tpope/vim-dispatch'


call plug#end()

let g:python3_host_prog = '/Users/marhs/.pyenv/versions/neovim3/bin/python'
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Aesthetics
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
set termguicolors
colorscheme PaperColor

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
set showcmd                   " commands in last line
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
set colorcolumn=140

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
set tabstop=2
set shiftwidth=2
set softtabstop=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PERSONAL KEYMAPS (Be careful in your workflow with these)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader remap to leader
let mapleader = "\<Space>"
let maplocalleader = "\\"

" Open .vimrc in a new tab with <Leader>vr
nmap <Leader>vr :tabe ~/.config/nvim/init.vim<cr>

" Search the selection in visual mode
vnoremap * y/<C-R>"<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fugitive
" <leader> g*
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader>gd :Gvdiff<CR>
nmap <Leader>gc :Git commit<CR>
nmap <Leader>gw :Gwrite<CR>
nmap <Leader>gr :Gread<CR>
nmap <Leader>gs :Git<CR>
nmap <Leader>gb :Git blame<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start on insert mode when opening a terminal
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufWinEnter,WinEnter term://* startinsert

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Telescope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <Leader>tt :Telescope tags<CR>
nnoremap <Leader>lg :Telescope live_grep<CR>
nnoremap <Leader>b <cmd>Telescope buffers<cr>

nnoremap <Leader>tb :TagbarToggle<CR>

set completeopt=menu,menuone,noselect

augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup END


lua << EOF
local nvim_lsp = require('lspconfig')
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  --buf_set_keymap('n', 'H', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  --buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  --buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  --buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  --buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  --buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

local luasnip = require 'luasnip'

-- 
-- Lualine
-- 

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

-- 
-- CMP: Completion from LSP
-- 

local cmp = require'cmp'
cmp.setup {
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  -- You must set mapping if you want.
  mapping = {
    ['<C-z>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end
  },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' }, -- For luasnip users.
      { name = 'buffer' },
    })
}
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['pyright'].setup {
  capabilities = capabilities
}

require'lspconfig'.clojure_lsp.setup{}


---------------
-- Treesitter
---------------

require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = { "python" },

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- list of language that will be disabled
    disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gvn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}

--
-- EFM for Flake8
--
local flake8 = {
  -- Requires flake8-efm
  lintCommand = "flake8 --format efm --stdin-display-name ${INPUT} -",
  lintStdin = true,
  lintFormats = {
    "%f:%l:%c:%t:%m",
  }
}

--require "lspconfig".efm.setup {
    --init_options = {documentFormatting = false, codeAction = false},
    --filetypes = {'python'},
    --settings = {
        --rootMarkers = {".git/"},
        --languages = {
            --python = {flake8}
        --}
    --}
--}
require('trouble').setup {
  mode = "document_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
}

require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- you can specify color or cterm_color instead of specifying both of them
 -- DevIcon will be appended to `name`
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    cterm_color = "65",
    name = "Zsh"
  }
 };
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}

EOF
