local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local lazy = require('lazy')

lazy.setup({
    { 'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons' },
    'airblade/vim-gitgutter',
    'scrooloose/nerdcommenter',
    'mhinz/vim-startify',
    'junegunn/fzf',
    'junegunn/fzf.vim',
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    'ap/vim-css-color',
    'haya14busa/is.vim',
    'liuchengxu/vim-which-key',
    'justinmk/vim-sneak',
    'mbbill/undotree',
    'echasnovski/mini.surround',
    'folke/tokyonight.nvim',
    'nvim-treesitter/nvim-treesitter',
    'nvim-treesitter/nvim-treesitter-context',
    'navarasu/onedark.nvim',
    'morhetz/gruvbox',
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'rafamadriz/friendly-snippets',
    'neovim/nvim-lspconfig',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'ray-x/lsp_signature.nvim',
    'L3MON4D3/LuaSnip',
    'nvimtools/none-ls.nvim',
    'saadparwaiz1/cmp_luasnip',
    'VonHeikemen/lsp-zero.nvim',
    'mhartington/formatter.nvim',
    'hiphish/rainbow-delimiters.nvim',
    'windwp/nvim-autopairs',
    'github/copilot.vim'
})
