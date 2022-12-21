local telescope = require'telescope'
local builtin = require('telescope.builtin')

telescope.setup {
  extensions = {
    project = {
      base_dirs = {
        {path = '~/kooth/projects', max_depth = 2},
      },
      hidden_files = true, -- default: false
      theme = "dropdown",
      order_by = "recent",
      sync_with_nvim_tree = true, -- default false
    }
  }
}

telescope.load_extension('project')

vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})

vim.api.nvim_set_keymap(
        'n',
        '<leader>ff',
        ":Telescope find_files no_ignore=true<CR>",
        {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
        'n',
        '<leader>cd',
        ":lua require'telescope'.extensions.project.project{}<CR>",
        {noremap = true, silent = true}
)
