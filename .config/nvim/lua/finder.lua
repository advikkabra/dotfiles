require("telescope").setup {
    extensions = {
        file_browser = {}
    },
    pickers = {
        find_files = {
            mappings = {
                i = {
                    ["<C-up>"] = function(prompt_bufnr)
                        local current_picker =
                            require("telescope.actions.state").get_current_picker(prompt_bufnr)
                        -- cwd is only set if passed as telescope option
                        local cwd = current_picker.cwd and tostring(current_picker.cwd)
                            or vim.loop.cwd()
                        local parent_dir = vim.fs.dirname(cwd)

                        require("telescope.actions").close(prompt_bufnr)
                        require("telescope.builtin").find_files {
                            prompt_title = vim.fs.basename(parent_dir),
                            cwd = parent_dir,
                        }
                    end,
                },
            },
        },
    }
}

require("telescope").load_extension "file_browser"
