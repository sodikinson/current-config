return {

      {
            "nvim-lualine/lualine.nvim",
            event = "VeryLazy",
            opts = {},
            config = function()
                  local colors = {
                        blue = "#eb6f92",
                        cyan = "#9ccfd8",
                        black = "#26233a",
                        white = "#e0def4",
                        red = "#f6c177",
                        violet = "#faf4ed",
                        grey = "#232136",
                        rose = "#d7827e",
                  }

                  local bubbles_theme = {
                        normal = {
                              a = { fg = colors.violet, bg = colors.black },
                              b = { fg = colors.white, bg = colors.grey },
                              c = { fg = colors.white },
                        },

                        insert = { a = { fg = colors.blue, bg = colors.black } },
                        visual = { a = { fg = colors.cyan, bg = colors.black } },
                        replace = { a = { fg = colors.black, bg = colors.red } },
                        command = { a = { fg = colors.rose, bg = colors.black } },

                        inactive = {
                              a = { fg = colors.white, bg = colors.black },
                              b = { fg = colors.white, bg = colors.black },
                              c = { fg = colors.white },
                        },
                  }

                  require("lualine").setup({
                        options = {
                              theme = bubbles_theme,
                              component_separators = "",
                              section_separators = { left = "", right = "" },
                        },
                        sections = {
                              lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
                              lualine_b = { "filename", "branch" },
                              lualine_c = {
                                    "%=",
                                    "diagnostics" --[[ add your center compoentnts here in place of this comment ]],
                              },
                              lualine_x = {},
                              lualine_y = { "filetype", "progress" },
                              lualine_z = {
                                    { "location", separator = { right = "" }, left_padding = 2 },
                              },
                        },
                        inactive_sections = {
                              lualine_a = { "filename" },
                              lualine_b = {},
                              lualine_c = {},
                              lualine_x = {},
                              lualine_y = {},
                              lualine_z = { "location" },
                        },
                        tabline = {},
                        extensions = {},
                  })
            end,
      },
}
