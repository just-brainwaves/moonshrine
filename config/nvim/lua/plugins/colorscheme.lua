-- ~/.config/nvim/lua/plugins/colorscheme.lua
return {
  -- Install kanagawa
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      compile = true,
      undercurl = true,
      transparent = false,
      terminalColors = true,
      theme = "dragon",       -- darkest variant, closest to void black
      background = {
        dark = "dragon",
        light = "lotus",
      },
      colors = {
        theme = {
          dragon = {
            ui = {
              bg            = "#08080d",   -- void
              bg_dim        = "#0c0c14",   -- abyss
              bg_gutter     = "#111119",   -- midnight
              bg_p1         = "#16161f",   -- obsidian
              bg_p2         = "#1d1d28",   -- slate
              special       = "#c01638",   -- scarlet
              fg            = "#cecee0",   -- moonlight
            },
          },
        },
      },
      overrides = function(colors)
        local c = colors.theme
        return {
          -- Crimson cursor line
          CursorLine          = { bg = "#16161f" },
          -- Crimson visual selection
          Visual              = { bg = "#2a0a12" },
          -- Crimson search highlight
          Search              = { bg = "#580010", fg = "#f6f6fa" },
          CurSearch           = { bg = "#c01638", fg = "#f6f6fa" },
          -- Crimson for errors, green for hints
          DiagnosticError     = { fg = "#de2448" },
          DiagnosticWarn      = { fg = "#f04068" },
          DiagnosticHint      = { fg = "#5a9e6e" },
          DiagnosticInfo      = { fg = "#a8a8be" },
          -- Git signs crimson/green
          GitSignsAdd         = { fg = "#408055" },
          GitSignsChange      = { fg = "#a8a8be" },
          GitSignsDelete      = { fg = "#c01638" },
          -- Matching Moonshrine statusline colors
          StatusLine          = { bg = "#08080d", fg = "#cecee0" },
          StatusLineNC        = { bg = "#0c0c14", fg = "#5e5e72" },
        }
      end,
    },
    config = function(_, opts)
      require("kanagawa").setup(opts)
      vim.cmd("colorscheme kanagawa-dragon")
    end,
  },

  -- Tell LazyVim to use kanagawa as the colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa-dragon",
    },
  },
}