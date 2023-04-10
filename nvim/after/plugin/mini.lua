require('mini.ai').setup()
require('mini.comment').setup() -- Use `gc`
require('mini.bracketed').setup()
require('mini.surround').setup({
  mappings = {
    add = "",
    delete = "ds",
    find_left = "[s",
    find = "]s",
    highlight = "",
    replace = "cs",
    update_n_lines = "",
  }
})
require('mini.indentscope').setup()

require('mini.trailspace').setup()
vim.keymap.set('n',
    "<leader>ws",
    ":lua MiniTrailspace.trim()<CR>",
    { desc = 'Trim all trailing whitespace' }
)

local starter = require('mini.starter')
starter.setup({
    evaluate_single = true,
})
