local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    "folke/which-key.nvim",
    { "folke/neoconf.nvim", cmd = "Neoconf" },

    -- Telescope
    { 'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },
    { 'nvim-telescope/telescope-project.nvim',
        dependencies = { { 'nvim-telescope/telescope-file-browser.nvim' } } },

    -- Treesitter
    { 'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },

    -- Git
    { 'tpope/vim-fugitive' },
    { 'lewis6991/gitsigns.nvim' },
    { 'cwebster2/github-coauthors.nvim' },

    -- LSP / Diagnostics
    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    },
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lua' },
    { 'jose-elias-alvarez/null-ls.nvim' },
   -- { 'lukas-reineke/lsp-format.nvim' }

    { 'Olical/conjure' },
    { 'PaterJason/cmp-conjure' },
    { 'tpope/vim-dispatch' },
    { 'clojure-vim/vim-jack-in' },
    { 'radenling/vim-dispatch-neovim' },

    { 'folke/trouble.nvim',
       dependencies = { { 'nvim-tree/nvim-web-devicons' } },
       config = function()
           require("trouble").setup {
               mode = "document_diagnostics"
           }
       end
   },

   -- Files
   { 'stevearc/oil.nvim',
     opts = {},
     -- Optional dependencies
     dependencies = { "nvim-tree/nvim-web-devicons" },
   },


   -- Others
    'echasnovski/mini.nvim',
    'ggandor/leap.nvim',

   -- Colorscheme and aesthetic
   { 'catppuccin/nvim',
       as = "catppuccin",
   },
   { 'kyazdani42/nvim-web-devicons' },
   { 'nvim-lualine/lualine.nvim',
      dependencies = { 'kyazdani42/nvim-web-devicons', opt = true }
   },
}

require("lazy").setup(plugins)
