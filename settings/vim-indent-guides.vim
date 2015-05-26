let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black   ctermbg=237
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=DarkGrey ctermbg=236

autocmd VimEnter * IndentGuidesEnable

nnoremap <silent> <F5> :IndentGuidesToggle<cr>
