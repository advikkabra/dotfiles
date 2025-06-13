let g:python3_host_prog='~/.config/nvim/neovim_env/bin/python3'

if !(exists('g:vscode'))
    let mapleader = " "

    lua require("plugins")
    lua require("lsp")
    lua require("snippets")
    lua require("finder")

    "fzf key remappings
    nnoremap <silent> <C-p> <cmd>Telescope find_files<CR>
    nnoremap <silent> <C-b> <cmd>Buffers<CR>
    nnoremap <silent> <C-m> <cmd>Telescope oldfiles<cr>
    nnoremap <silent> <leader>s <cmd>Telescope treesitter<cr>
    nnoremap <silent> <leader>f <cmd>Telescope live_grep<cr>
    nnoremap <silent> <leader>o :Files<CR>
    nnoremap <silent> <leader>l :BLines<CR>
    nnoremap <silent> <leader>m :Lines<CR>

    " Formatting
    nnoremap <silent> <leader>i :LspZeroFormat<CR>zR

    " System clipboard mappings
    noremap <leader>y "+y
    noremap <leader>p "+p

    " Normal save shortcut
    nnoremap <C-s> :w<cr>
    nnoremap <leader>u :UndotreeToggle<CR>

    nnoremap <silent> <leader>h :nohlsearch<cr>
    nnoremap <leader><Space> :b#<cr>
    

    inoremap jk <ESC>
    inoremap kj <ESC>
    nmap <C-n> :Telescope file_browser<CR>
    nmap <leader>n :Telescope file_browser path=%:p:h select_buffer=true<CR>
    vmap ++ <plug>NERDCommenterToggle
    nmap ++ <plug>NERDCommenterToggle

    " Switching H, L and ^, $ capabilities
    nnoremap ^ H
    nnoremap $ L
    nnoremap H ^
    nnoremap L $
    vnoremap ^ H
    vnoremap $ L
    vnoremap H ^
    vnoremap L $

    " remapping pslit navigation keys
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l

    nnoremap <M-f> :LspZeroFormat<CR>

    " vim which key config
    nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
    " By default timeoutlen is 1000 ms
    set timeoutlen=500

    " j/k will move virtual lines (lines that wrap)
    noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
    noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

    set relativenumber
    set number

    set splitright

    set smarttab
    set cindent
    set tabstop=4
    set shiftwidth=4
    " always uses spaces instead of tab characters
    set expandtab

    set mouse=nv
    set scrolloff=4 " Always keep 4 lines above/below cursor

    set foldmethod=expr
    set foldexpr=nvim_treesitter#foldexpr()
    autocmd BufReadPost,FileReadPost * normal zR

    let g:onedark_config = { 
                \ 'style': 'deep',
                \ 'transparent': v:true,
    \ }
    let g:tokyonight_style = 'night'
    let g:tokyonight_transparent = 1
    lua require("colorscheme")
    colorscheme tokyonight
    let g:rainbow_delimiters = {
        \ 'strategy': {
            \ '': rainbow_delimiters#strategy.global,
            \ 'vim': rainbow_delimiters#strategy.local,
        \ },
        \ 'query': {
            \ '': 'rainbow-delimiters',
            \ 'lua': 'rainbow-blocks',
        \ },
        \ 'highlight': [
            \ 'RainbowDelimiterCyan',
            \ 'RainbowDelimiterGreen',
            \ 'RainbowDelimiterBlue',
            \ 'RainbowDelimiterViolet',
            \ 'RainbowDelimiterOrange',
            \ 'RainbowDelimiterYellow',
        \ ],
    \ }

    if exists('+termguicolors')
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
        set termguicolors
    endif

    " from readme
    " if hidden is not set, TextEdit might fail.
    set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
    set updatetime=300

    " don't give |ins-completion-menu| messages.
    set shortmess+=c

    " always show signcolumns
    set signcolumn=yes

    "Sneak config
    let g:sneak#label = 1

    " case insensitive sneak
    let g:sneak#use_ic_scs = 1

    " immediately move to the next instance of search, if you move the cursor sneak is back to default behavior
    let g:sneak#s_next = 1

    " remap so I can use , and ; with f and t
    map gS <Plug>Sneak_,
    map gs <Plug>Sneak_;

    " Change the colors
    highlight Sneak guifg=black guibg=#00C7DF ctermfg=black ctermbg=cyan
    highlight SneakScope guifg=red guibg=yellow ctermfg=red ctermbg=yellow 


    " Terminal config
    
   " Exit from terminal buffer (Neovim) more easily (remaps Esc key in
    " terminal)
    tnoremap <C-[> <C-\><C-n>

    " Switch to terminal buffer automatically (when only one terminal is
    " open)
    nnoremap <M-0> :b term://<CR>

    " Move between windows exactly the same way as usual
    tnoremap <C-h> <C-]><C-w>h
    tnoremap <C-j> <C-]><C-w>j
    tnoremap <C-k> <C-]><C-w>k
    tnoremap <C-l> <C-]><C-w>l 

    " Opening terminal in split window with leader t
    function! OpenTerminal()
        set splitright
        if has('win32')
            :e term://powershell
        else
            :vsplit term://zsh
        endif
        vertical resize 50
    endfunction

    " Open terminal buffer (M stands for the Alt key)
    nnoremap <M-t> :call OpenTerminal()<CR>

    " Open git bash for windows
    nnoremap <M-b> :e term://bash<CR>

    function! OpenSplitTerminal()
        set splitbelow
        if has('win32')
            :split term://powershell
        else
            :split term://zsh
        endif
        resize 10
    endfunction

    function! OpenSplitBash()
        set splitbelow
        :split term://bash
        resize 10
    endfunction

    nnoremap <leader>t :call OpenSplitTerminal()<CR>
    nnoremap <leader>tb :call OpenSplitBash()<CR>

    augroup IndentWidth1
        au!
        au BufNewFile,BufRead *.js,*.jsx,*.ts,*.tsx,*.html,*.css,*.c,*.cpp,*.h,*.hpp setl shiftwidth=2
        au BufNewFile,BufRead *.js,*.jsx,*.ts,*.tsx,*.html,*.css,*.c,*.cpp,*.h,*.hpp setl tabstop=2
    augroup END

endif


