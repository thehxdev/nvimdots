-- dracula
-- monokai_pro
-- catppuccin 
-- tokyonight
-- neon
-- nord
-- gruvbox
-- darkplus

local colorscheme = "gruvbox"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end


-- ######################## --
--   Neon Theme Options     --
-- ######################## --

--vim.g.neon_style = "default"  -- default , doom , dark
--vim.g.neon_italic_keyword = true
--vim.g.neon_italic_function = true
--vim.g.neon_transparent = false

-- ---------------------------------------------------------- --

-- ######################## --
--  Material Theme Options  --
-- ######################## --

--vim.g.material_style = "deep ocean"  -- darker, lighter, oceanic, palenight, deep ocean

-- ---------------------------------------------------------- --

-- ######################## --
--    Nord Theme Options    --
-- ######################## --

--vim.g.nord_contrast = true
--vim.g.nord_borders = false
--vim.g.nord_disable_background = false
--vim.g.nord_italic = true
--vim.g.nord_uniform_diff_background = true

-- ---------------------------------------------------------- --

-- ######################## --
--   Dracula Theme Options  --
-- ######################## --

--vim.g.show_end_of_buffer = true -- default false
--vim.g.transparent_bg = false -- default false
--vim.g.italic_comment = true -- default false
--vim.g.lualine_bg_color = "#44475a", -- default nil

-- ---------------------------------------------------------- --

-- ######################## --
--   Sonokai Theme Options  --
-- ######################## --

--vim.g.sonokai_style = "andromeda"  -- default, atlantis, andromeda, shusia, maia, espresso
--vim.g.sonokai_disable_italic_comment = 0  -- 1 or 0
--vim.g.sonokai_enable_italic = 1  -- 1 or 0
--vim.g.sonokai_cursor = auto  -- auto, red, orange, yellow, green, blue, purple
--vim.g.sonokai_transparent_background = 0  -- 1 or 0 or 2
--vim.g.sonokai_disable_terminal_colors = 0
