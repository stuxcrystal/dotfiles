" set termguicolors t_Co=256

if filereadable(expand("~/.config/nvim/local.vim"))
    source ~/.config/nvim/local.vim
end

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

if $WSL == 'yes'
    source ~/.config/nvim/wsl.vim
endif

if filereadable(expand("~/.config/nvim/$STUX_ENVIRONMENT.vim"))
    source ~/.config/nvim/$STUX_ENVIRONMENT.vim
endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
