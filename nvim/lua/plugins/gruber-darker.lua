return {
        {
                "blazkowolf/gruber-darker.nvim",
                name = "gruber-darker",
                opts = {
                        bold = true,
                        invert = {
                                signs = false,
                                tabline = false,
                                visual = false,
                        },
                        italic = {
                                strings = false,
                                comments = true,
                                operators = false,
                                folds = true,
                        },
                        undercurl = false,
                        underline = true,
                },
        },
        {
                "LazyVim/LazyVim",
                opts = {
                        colorscheme = "gruber-darker",
                },
        },
}
