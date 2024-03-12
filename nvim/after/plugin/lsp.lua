local lsp = require('lsp-zero')
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
--local null_ls = require("null-ls")
local lspconfig = require('lspconfig')

lsp.preset('recommended')

require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here
  -- with the ones you want to install
  ensure_installed = {'pyright', 'ruff_lsp'},
  handlers = {
    lsp.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  },
})


lspconfig.pyright.setup({
    settings = {
        -- python = {
        --     exclude = { ".venv" },
        --     venvPath = ".venv",
        --     venv = ".",
        -- },
    }
})

-- Configure `ruff-lsp`.
-- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ruff_lsp
-- For the default config, along with instructions on how to customize the settings
lspconfig.ruff_lsp.setup {
  init_options = {
    settings = {
      -- Any extra CLI arguments for `ruff` go here.
      args = {},
    }
  }
}


-- Keymaps
lsp.on_attach(function(client, bufnr)
   vim.keymap.set("n", "gd",          vim.lsp.buf.definition,       { desc = 'Go to symbol definition',      buffer = bufnr, remap = false })
   vim.keymap.set("n", "K",           vim.lsp.buf.hover,            { desc = 'Hover - Documentation',        buffer = bufnr, remap = false })
   vim.keymap.set("n", "<leader>lws", vim.lsp.buf.workspace_symbol, { desc = 'LSP - [WS] Workspace Symbol',  buffer = bufnr, remap = false })
   vim.keymap.set("n", "<leader>ld",  vim.diagnostic.open_float,    { desc = 'LSP - [D] Diagnostics float',  buffer = bufnr, remap = false })
   vim.keymap.set("n", "[d",          vim.diagnostic.goto_next,     { desc = 'LSP - Next diagnostic',        buffer = bufnr, remap = false })
   vim.keymap.set("n", "]d",          vim.diagnostic.goto_prev,     { desc = 'LSP - Prev diagnostic',        buffer = bufnr, remap = false })
   vim.keymap.set("n", "<leader>lca", vim.lsp.buf.code_action,      { desc = 'LSP - [CA] Code actions',      buffer = bufnr, remap = false })
   vim.keymap.set("n", "<leader>lrr", vim.lsp.buf.references,       { desc = 'LSP - [RR] References',        buffer = bufnr, remap = false })
   vim.keymap.set("n", "<leader>lrn", vim.lsp.buf.rename,           { desc = 'LSP - [RN] Rename',            buffer = bufnr, remap = false })
   vim.keymap.set("n", "<leader>lfm", vim.lsp.buf.format,           { desc = 'LSP - [FM] Format buffer',     buffer = bufnr, remap = false })
   vim.keymap.set("i", "<C-h>",       vim.lsp.buf.signature_help,   { desc = 'LSP - [<C-h>] Signature help', buffer = bufnr, remap = false })
end)

vim.diagnostic.config({
    virtual_text = true,
})

cmp.setup({
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'conjure' },
        { name = 'buffer',  keyword_length = 3 },
        { name = 'luasnip', keyword_length = 2 },
    }
})
