require('lualine').setup({
    options = {
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = { {
            'filename',
            path = 1,
            shorting_target = 80,
        } },
        lualine_x = { 'diagnostics' },
        lualine_y = { {
            function()
                local lsps = vim.lsp.get_active_clients({ bufnr = vim.fn.bufnr() })
                local icon = require("nvim-web-devicons").get_icon_by_filetype(
                    vim.api.nvim_buf_get_option(0, "filetype")
                )
                if lsps and #lsps > 0 then
                    local names = {}
                    for _, lsp in ipairs(lsps) do
                        table.insert(names, lsp.name)
                    end
                    return string.format("%s %s", table.concat(names, ", "), icon)
                else
                    return icon or ""
                end
            end,
            on_click = function()
                vim.api.nvim_command("LspInfo")
            end,
            color = function()
                local _, color = require("nvim-web-devicons").get_icon_cterm_color_by_filetype(
                    vim.api.nvim_buf_get_option(0, "filetype")
                )
                return { fg = color }
            end,
        } },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
})
