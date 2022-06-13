-- doom_userplugins - Doom nvim custom plugins
--
-- This file contains all the custom plugins that are not in Doom nvim but that
-- the user requires. All the available fields can be found here
-- https://github.com/wbthomason/packer.nvim#specifying-plugins
--
-- By example, for including a plugin with a dependency on telescope:
-- M.plugins {
--   {
--     'user/repository',
--     requires = { 'nvim-lua/telescope.nvim' },
--   },
-- }

local M = {}

M.source = debug.getinfo(1, "S").source:sub(2)

M.plugins = {
	{'tpope/vim-surround'},
	{'renerocksai/calendar-vim'},
	{
		'renerocksai/telekasten.nvim',
		config = function()
			local home = vim.fn.expand("~/notes/alphashuro/")

      require('telekasten').setup({
      	home = home,
      	take_over_my_home = true,
				dailies = home .. '/' .. 'journal',
				new_note_filename = "uuid-title"
      })
    end,
	},
	{'tpope/vim-scriptease'}
}

return M

-- vim: sw=2 sts=2 ts=2 noexpandtab

