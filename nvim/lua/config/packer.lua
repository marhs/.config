-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use { 'wbthomason/packer.nvim' }

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use {
        'nvim-telescope/telescope-project.nvim',
        requires = { { 'nvim-telescope/telescope-file-browser.nvim' } }
    }
    use 'cwebster2/github-coauthors.nvim'

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }


    -- Git
    use {
        'tpope/vim-fugitive'
    }
    use { 'lewis6991/gitsigns.nvim' }

    -- LSP / Diagnostics
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
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
    }
    use { 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-path' }
    use { 'saadparwaiz1/cmp_luasnip' }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-nvim-lua' }
    use { 'jose-elias-alvarez/null-ls.nvim' }
    --use { 'lukas-reineke/lsp-format.nvim' }

    use {
        "folke/trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                mode = "document_diagnostics"
            }
        end
    }

    use { 'Olical/conjure' }
    use { 'PaterJason/cmp-conjure' }
    use { 'tpope/vim-dispatch' }
    use { 'clojure-vim/vim-jack-in' }
    use { 'radenling/vim-dispatch-neovim' }

    -- Others
    use { 'gpanders/editorconfig.nvim' } -- To deprecate in next nvim versions
    use 'echasnovski/mini.nvim'
    use 'ggandor/leap.nvim'

    -- Colorscheme and aesthetic
    use {
        "catppuccin/nvim",
        as = "catppuccin",
    }
    use { 'kyazdani42/nvim-web-devicons' }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
end)
