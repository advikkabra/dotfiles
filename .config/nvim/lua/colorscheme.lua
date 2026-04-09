require("tokyonight").setup({
  style = "storm",
  transparent = true,
  styles = {
    keywords = { italic = false, bold = true },
  },
})
vim.cmd.colorscheme("tokyonight")

-- nvim-treesitter (main branch)
local ensure_installed = {
  "c", "lua", "vim", "cpp", "python", "javascript", "typescript", "rust",
}
local already_installed = require('nvim-treesitter.config').get_installed()
local to_install = vim.iter(ensure_installed)
  :filter(function(p) return not vim.tbl_contains(already_installed, p) end)
  :totable()
if #to_install > 0 then
  require('nvim-treesitter').install(to_install)
end

vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    pcall(vim.treesitter.start)
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

require("lualine").setup({
  options = { theme = "tokyonight" },
})

require("bufferline").setup{}
