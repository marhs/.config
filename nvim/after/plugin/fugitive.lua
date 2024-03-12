vim.keymap.set("n", "<leader>gs", vim.cmd.Git,    { desc = 'Git [s] status' })
vim.keymap.set("n", "<leader>gw", vim.cmd.Gwrite, { desc = 'Git [w] write - add current buffer' })
vim.keymap.set("n", "<leader>gr", vim.cmd.Gread,  { desc = 'Git [r] read - checkout file state' })
vim.keymap.set("n", "<leader>gd", vim.cmd.Gvdiff, { desc = 'Git [d] diff (vertical split)' })
