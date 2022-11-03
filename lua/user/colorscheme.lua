-- dracula
-- monokai_pro
-- catppuccin 
-- catppuccin-macchiato
-- catppuccin-mocha
-- tokyonight
-- neon
-- nord
-- gruvbox
-- darkplus
-- aurora
-- codemonkey
-- ferrum
-- lunar
-- onedark
-- onedarker
-- onedarkest
-- onenord
-- spacedark
-- system76
-- tomorrow

local colorscheme = "catppuccin-mocha"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
