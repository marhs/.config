vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.guicursor = ""

vim.opt.nu = true
-- vim.opt.relativenumber = true

vim.o.listchars = 'tab:> ,trail:-,nbsp:+'

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.splitbelow = true
vim.opt.splitright = true

-- vim.opt.colorcolumn = "80"

vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = "400" })
    end,
})

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevelstart = 50

vim.cmd('colorscheme catppuccin-mocha')
