-- dracula
-- monokai_pro
-- catppuccin 
-- tokyonight
-- neon
-- nord
-- gruvbox
-- darkplus

local colorscheme = "dracula"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
