let g:pymode_lint_write = 0

" Check code on every save (every)
let g:pymode_lint_unmodified = 1
" Just use mccabe, everything else is managed via Syntastic
let g:pymode_lint_checkers = ['mccabe']
let g:pymode_rope = 1
