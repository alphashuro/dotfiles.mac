return {
  -- - to open explorer in current window
  'tpope/vim-vinegar',

  -- Sneak but better
  {
    'ggandor/leap.nvim',
    config = function()
      require("leap").add_default_mappings()
    end
  },

  -- manipulate surrounding chars
  {
    'ur4ltz/surround.nvim',
    config = function()
      require "surround".setup { mappings_style = "surround" }
    end
  },

  -- Distraction free writing
  {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {}
    end
  },

  -- Dims inactive portions of the code you're editing
  {
    "folke/twilight.nvim",
    config = function()
      require("twilight").setup {}
    end
  },

  {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      local null_ls = require("null-ls")

      local sources = {
        null_ls.builtins.formatting.prettier,
      }

      local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
      local event = "BufWritePre" -- or "BufWritePost"
      local async = event == "BufWritePost"

      null_ls.setup({
        sources = sources,
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.keymap.set("n", "<Leader>f", function()
              vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
            end, { buffer = bufnr, desc = "[lsp] format" })

            -- format on save
            vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
            vim.api.nvim_create_autocmd(event, {
              buffer = bufnr,
              group = group,
              callback = function()
                vim.lsp.buf.format({ bufnr = bufnr, async = async })
              end,
              desc = "[lsp] format on save",
            })
          end

          if client.supports_method("textDocument/rangeFormatting") then
            vim.keymap.set("x", "<Leader>f", function()
              vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
            end, { buffer = bufnr, desc = "[lsp] format" })
          end
        end,
      })
    end
  },

  {
    'MunifTanjim/prettier.nvim',
    config = function()
      require("prettier").setup({
        bin = 'prettierd'
      })
    end
  },

  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  }
}
