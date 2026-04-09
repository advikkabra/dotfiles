local wezterm = require 'wezterm'
local config = {}
local act = wezterm.action

config.font = wezterm.font 'Fira Code Nerd Font'
config.window_background_opacity = 0.98
config.color_scheme = 'One Dark'

config.window_background_gradient = {
    colors = { '#151515', '#181818' },
    -- Specifices a Linear gradient starting in the top left corner.
    orientation = { Linear = { angle = -45.0 } },
}

config.cursor_thickness = '0'

config.warn_about_missing_glyphs = false

config.default_cursor_style = "SteadyBar"

config.keys = {
    { key = 'Backspace', mods = 'CTRL', action = act.SendKey { key = 'w', mods = 'CTRL' } },
}

return config
