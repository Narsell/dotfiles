syntax on
set clipboard=unnamedplus
set tabstop=4
" Highlight search patterns
set is hls
" Relative line numbers
set number
set relativenumber

" Copy to clipboard (Ctrl+C)
vnoremap <C-c> "+y

" Navigate page up/down and center cursor
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")
