if vim.g.vscode then
    -- VSCode extension
else
    -- ordinary Neovim
    require("config.remap")
    require("config.lazy")
    require("config.set")
    require("config.colors")
    require("config.neovide")
end
