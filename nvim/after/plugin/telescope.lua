local telescope = require 'telescope'
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

telescope.setup {
    defaults = {
        mappings = {
            i = {
                ["<C-Q>"] = actions.smart_send_to_qflist
            },
        },
    },
    extensions = {
        project = {
            base_dirs = {
                { path = '~/kooth/projects', max_depth = 2 },
            },
            hidden_files = false, -- default: false
            theme = "dropdown",
            order_by = "recent",
            sync_with_nvim_tree = false, -- default false
        },
        githubcoauthors = {
            theme = "dropdown",
        },
        fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        }
    }
}

telescope.load_extension('project')
--telescope.load_extension('fzf')

-- Mappings
vim.keymap.set('n', '<leader><leader>', builtin.builtin, { desc = 'Telescope' })
vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Add git co-authors' })
vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'Show files: git only' })
vim.keymap.set('n', '<leader>fs', builtin.live_grep, { desc = 'File search: live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Show files: open buffers' })
vim.keymap.set('n', '<leader>km', builtin.keymaps, { desc = 'Assigned keymaps' })

vim.api.nvim_set_keymap(
    'n',
    '<leader>ff',
    ":Telescope find_files no_ignore=true<CR>",
    { noremap = true, silent = true, desc = 'Find ALL files' }
)
vim.api.nvim_set_keymap(
    'n',
    '<leader>cd',
    ":lua require'telescope'.extensions.project.project{}<CR>",
    { noremap = true, silent = true, desc = 'Select project' }
)
vim.api.nvim_set_keymap(
    'n',
    '<leader>ca',
    ":lua require('telescope').extensions.githubcoauthors.coauthors()<CR>",
    { noremap = true, silent = true, desc = 'Add git co-author from history' }
)
