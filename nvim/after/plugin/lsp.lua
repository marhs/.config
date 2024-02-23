local lsp = require('lsp-zero')
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
local null_ls = require("null-ls")
local lspconfig = require('lspconfig')

lsp.preset('recommended')

require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here 
  -- with the ones you want to install
  ensure_installed = {'pyright'},
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

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    --require("lsp-format").on_attach(client)

    --if client.name == "eslint" then
    -- vim.cmd.LspStop('eslint')
    -- return
    --end
    --

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
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

null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.flake8.with({
            extra_args = { "--ignore", "E501" }
        }),
        -- :lua vim.lsp.buf.format()
        null_ls.builtins.formatting.black.with({
            extra_args = { "--line-length=120" }
        }),
        --E501
        --    null_ls.builtins.diagnostics.clj_kondo
    },
})

lsp.setup()
