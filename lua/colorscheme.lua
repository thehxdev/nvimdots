-- local colorscheme = "gruberdarker"
local colorscheme = "tokyonight"
-- local colorscheme = "catppuccin"
-- local colorscheme = "gruvbox"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end
