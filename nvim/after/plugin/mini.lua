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

require('mini.trailspace').setup({
  -- Highlight only in normal buffers (ones with empty 'buftype'). This is
  -- useful to not show trailing whitespace where it usually doesn't matter.
  only_in_normal_buffers = false,
})
vim.keymap.set('n',
    "<leader>ws",
    ":lua MiniTrailspace.trim()<CR>",
    { desc = 'Trim all trailing whitespace' }
)

local starter = require('mini.starter')
starter.setup({
    evaluate_single = true,
})
