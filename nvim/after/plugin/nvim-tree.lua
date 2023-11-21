require("nvim-tree").setup()

vim.api.nvim_set_keymap(
   'n',
   '<leader>nt',
   ":NvimTreeToggle <CR>",
   { noremap = true, silent = true, desc = 'Toggle NvimTree' }
)
