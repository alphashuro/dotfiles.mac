local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = "Gruvbox light, hard (base16)"

config.font = wezterm.font 'SF Mono'
config.font_size = 12

config.keys = {
  {
    key = "p",
    mods = "CMD|SHIFT",
    action = wezterm.action.ActivateCommandPalette,
  },
}

return config
