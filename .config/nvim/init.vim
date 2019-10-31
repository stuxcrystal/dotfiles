" set termguicolors t_Co=256

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='base16_atelierlakeside_custom'

tnoremap <Esc><Esc> <C-\><C-n>

set fillchars+=vert:\ 
highlight VertSplit ctermfg=234 gui=none 

set relativenumber number
set colorcolumn=79,119 cursorline
set nowrap
set tabstop=4 expandtab shiftwidth=4 autoindent smartindent

highlight ColorColumn ctermbg=236
highlight CursorLine ctermbg=238 cterm=NONE
highlight CursorColumn ctermbg=238 cterm=NONE

