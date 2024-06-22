-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
if true then return {} end

-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {

      -- override nvim-cmp and add cmp-emoji

      -- change some telescope options and a keymap to browse plugin files

      { import = "lazyvim.plugins.extras.lang.typescript" },

      -- use mini.starter instead of alpha
      { import = "lazyvim.plugins.extras.ui.mini-starter" },

      -- add jsonls and schemastore packages, and setup treesitter for json, json5 and jsonc
      { import = "lazyvim.plugins.extras.lang.json" },
      -- Autotags
      {
            "windwp/nvim-ts-autotag",
            opts = {},
      },

      -- delete buffer
      {
            "famiu/bufdelete.nvim",
            event = "VeryLazy",
            config = function()
                  vim.keymap.set(
                        "n",
                        "Q",
                        ":lua require('bufdelete').bufdelete(0, false)<cr>",
                        { noremap = true, silent = true, desc = "Delete buffer" }
                  )
            end,
      },

      -- comments
      {
            "numToStr/Comment.nvim",
            opts = {},
            lazy = false,
      },
      -- useful when there are embedded languages in certain types of files (e.g. Vue or React)
      { "joosepalviste/nvim-ts-context-commentstring", lazy = true },

      -- Neovim notifications and LSP progress messages
      {
            "j-hui/fidget.nvim",
            branch = "legacy",
            enabled = false,
            config = function()
                  require("fidget").setup({
                        window = { blend = 0 },
                  })
            end,
      },

      -- Smooth scrolling neovim plugin written in lua
      {
            "karb94/neoscroll.nvim",
            config = function()
                  require("neoscroll").setup({
                        stop_eof = true,
                        easing_function = "sine",
                        hide_cursor = true,
                        cursor_scrolls_alone = true,
                  })
            end,
      },

      -- find and replace
      {
            "windwp/nvim-spectre",
            event = "BufRead",
      },

      -- Add/change/delete surrounding delimiter pairs with ease
      {
            "kylechui/nvim-surround",
            version = "*",
            event = "VeryLazy",
            config = function()
                  require("nvim-surround").setup()
            end,
      },

      -- Heuristically set buffer options
      {
            "tpope/vim-sleuth",
      },

      -- Neovim setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API
      {
            "folke/neodev.nvim",
            config = function()
                  require("neodev").setup({
                        library = { plugins = { "neotest" }, types = true },
                  })
            end,
      },

      -- Neovim Lua plugin to automatically manage character pairs. Part of 'mini.nvim' library.
      {
            "echasnovski/mini.pairs",
            event = "VeryLazy",
            config = function(_, opts)
                  require("mini.pairs").setup(opts)
            end,
      },

      -- Lorem Ipsum generator for Neovim
      {
            "derektata/lorem.nvim",
            enabled = false,
            config = function()
                  local lorem = require("lorem")
                  lorem.setup({
                        sentenceLength = "mixedShort",
                        comma = 1,
                  })
            end,
      },

      -- editor config support
      {
            "editorconfig/editorconfig-vim",
      },

      -- Enhanced f/t motions for Leap
      {
            "ggandor/flit.nvim",
            keys = function()
                  ---@type LazyKeys[]
                  local ret = {}
                  for _, key in ipairs({ "f", "F", "t", "T" }) do
                        ret[#ret + 1] = { key, mode = { "n", "x", "o" }, desc = key }
                  end
                  return ret
            end,
            opts = { labeled_modes = "nx" },
      },
      -- mouse replacement
      {
            "ggandor/leap.nvim",
            keys = {
                  { "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
                  { "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
                  { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
            },
            config = function(_, opts)
                  local leap = require("leap")
                  for k, v in pairs(opts) do
                        leap.opts[k] = v
                  end
                  leap.add_default_mappings(true)
                  vim.keymap.del({ "x", "o" }, "x")
                  vim.keymap.del({ "x", "o" }, "X")
            end,
      },

      {
            "utilyre/barbecue.nvim",
            name = "barbecue",
            version = "*",
            dependencies = {
                  "SmiteshP/nvim-navic",
                  "nvim-tree/nvim-web-devicons", -- optional dependency
            },
            opts = {
                  -- configurations go here
            },
            config = function()
                  require("barbecue").setup({
                        create_autocmd = false, -- prevent barbecue from updating itself automatically
                  })

                  vim.api.nvim_create_autocmd({
                        "WinScrolled", -- or WinResized on NVIM-v0.9 and higher
                        "BufWinEnter",
                        "CursorHold",
                        "InsertLeave",

                        -- include this if you have set `show_modified` to `true`
                        -- "BufModifiedSet",
                  }, {
                        group = vim.api.nvim_create_augroup("barbecue.updater", {}),
                        callback = function()
                              require("barbecue.ui").update()
                        end,
                  })
            end,
      },
      -- persist sessions
      {
            "folke/persistence.nvim",
            event = "BufReadPre", -- this will only start session saving when an actual file was opened
            opts = {},
      },

      -- better code annotation
      {
            "danymat/neogen",
            dependencies = {
                  "nvim-treesitter/nvim-treesitter",
                  "L3MON4D3/LuaSnip",
            },
            config = function()
                  local neogen = require("neogen")

                  neogen.setup({
                        snippet_engine = "luasnip",
                  })
            end,
            -- version = "*"
      },
}
