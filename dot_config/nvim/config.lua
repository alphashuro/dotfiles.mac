-- doom_config - Doom Nvim user configurations file
--
-- This file contains the user-defined configurations for Doom nvim.
-- Just override stuff in the `doom` global table (it's injected into scope
-- automatically).

-- ADDING A PACKAGE
--
-- doom.use_package("EdenEast/nightfox.nvim", "sainnhe/sonokai")
doom.use_package({
  "ur4ltz/surround.nvim",
  config = function()
    require("surround").setup({mappings_style = "sandwich"})
  end
})
doom.use_package({
  "namjul/dendron.nvim",
  config = function ()
    require("dendron").setup({
      dendron_dir = '~/Dropbox/notes/knowledge'
    })
  end
})
doom.use_package("tpope/vim-vinegar")
doom.use_package("lervag/wiki.vim")
doom.use_package("nvim-treesitter/nvim-treesitter-textobjects")

doom.features.explorer.settings.view.mappings.list = {
  { key = "<CR>", action = "edit_in_place" }
}
doom.features.linter.settings.format_on_save = true

-- print(vim.inspect(doom.features.explorer.settings.view))

-- ADDING A KEYBIND
--
-- doom.use_keybind({
--   -- The `name` field will add the keybind to whichkey
--   {"<leader>s", name = '+search', {
--     -- Bind to a vim command
--     {"g", "Telescope grep_string<CR>", name = "Grep project"},
--     -- Or to a lua function
--     {"p", function()
--       print("Not implemented yet")
--     end, name = ""}
--   }}
-- })
doom.use_keybind({
  {
    "-",
    function()
        require"nvim-tree".open_replacing_current_buffer()
    end
  }
})
doom.use_keybind({
  {"<leader>ff", "<cmd>Telescope find_files hidden=true no_ignore=true<CR>", name = "find files"},
  {"<leader><space>", "<cmd>Telescope find_files hidden=true no_ignore=true<CR>", name = "find files"},
})

-- package.preload("nvim-tree")

-- ADDING A COMMAND
--
-- doom.use_cmd({
--   {"CustomCommand1", function() print("Trigger my custom command 1") end},
--   {"CustomCommand2", function() print("Trigger my custom command 2") end}
-- })

-- ADDING AN AUTOCOMMAND
--
-- doom.use_autocmd({
--   { "FileType", "javascript", function() print('This is a javascript file') end }
-- })

vim.diagnostic.config({virtual_text = false})
vim.g.wiki_root = '/Users/alpha/Library/CloudStorage/Dropbox/wiki'

doom.core.treesitter.settings.show_compiler_warning_message = false

-- vim: sw=2 sts=2 ts=2 expandtab
