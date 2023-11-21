local leap = require('leap')
-- leap.add_default_mappings()
vim.keymap.set({'n'}, 's', '<Plug>(leap-forward-to)')
vim.keymap.set({'n'}, 'S', '<Plug>(leap-backward-to)')
