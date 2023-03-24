vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = 'Git status' })
vim.keymap.set("n", "<leader>gw", vim.cmd.Gwrite, { desc = 'Git add current buffer' })
vim.keymap.set("n", "<leader>gd", vim.cmd.Gvdiff, { desc = 'Git diff (vertical split)' })
