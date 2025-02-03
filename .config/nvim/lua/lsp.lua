local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({ buffer = bufnr })
    preserve_mappings = false
    vim.keymap.set({ 'n', 'x' }, 'gq', function()
        vim.lsp.buf.format({ async = false, timeout_ms = 3000 })
    end, opts)
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
    },
    handlers = {
        lsp_zero.default_setup,
    },
})

local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        -- `Enter` key to confirm completion
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })
            elseif require("luasnip").expand_or_jumpable() then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
        -- Ctrl+Space to trigger completion menu
        ['<C-Space>'] = cmp.mapping.complete(),

        -- Navigate between snippet placeholder
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),

        -- Scroll up and down in the completion documentation
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
    }),
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body);
        end
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    })
})

local util = require "formatter.util"

--require("formatter").setup {
---- Enable or disable logging
--logging = true,
---- Set the log level
--log_level = vim.log.levels.WARN,
---- All formatter configurations are opt-in
--filetype = {
--python = {
--require("formatter.filetypes.python").autopep8
--}
--}
--}

local null_ls = require('null-ls')

null_ls.setup({
    on_attach = function(client, bufnr)
        null_opts.on_attach(client, bufnr)
        --- you can add more stuff here if you need it
    end,
    sources = {
        null_ls.builtins.formatting.autopep8,
        null_ls.builtins.formatting.prettier
    }
})

require("nvim-autopairs").setup {}
require("lsp_signature").setup { select_signature_key = '<C-j>' }
require("luasnip").setup {}
require("luasnip.loaders.from_vscode").lazy_load()
