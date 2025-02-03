require("tokyonight").setup({
    style="storm",
    transparent=true,
    storm_brightness=1,
    styles = {
        keywords = {italic = false, bold=true},
    },
})
require('nvim-treesitter.configs').setup({
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "cpp", "python", "javascript", "typescript", "rust"},
  highlight = {
      enable = true
  },
})
require("lualine").setup({
    options = {
        theme = "nightfly"
    }
})
require("bufferline").setup{}
