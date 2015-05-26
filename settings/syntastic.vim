let g:syntastic_enable_signs=1
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_jump=0 " 0: no jump, 1: always jump, 2: jump on errors
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'

let g:syntastic_python_checkers=['flake8']

let g:syntastic_python_flake8_sort = 1
let g:syntastic_python_flake8_args = '--ignore=E501,E123,E702,E231'

" Use jshint (uses ~/.jshintrc)
let g:syntastic_javascript_checkers = ['jshint']

" Better :sign interface symbols
let g:syntastic_error_symbol = '✗'
let g:syntastic_style_error_symbol = '✗s'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_warning_symbol = '⚠s'

autocmd VimEnter,Colorscheme * :hi SyntasticErrorLine ctermbg=124
autocmd VimEnter,Colorscheme * :hi SyntasticErrorLine ctermfg=231

autocmd VimEnter,Colorscheme * :hi SyntasticStyleErrorLine ctermbg=0
" autocmd VimEnter,Colorscheme * :hi SyntasticStyleErrorLine ctermfg=231

autocmd VimEnter,Colorscheme * :hi SyntasticWarningLine ctermbg=208
autocmd VimEnter,Colorscheme * :hi SyntasticWarningLine ctermfg=231

set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" let g:loaded_syntastic_css_csslint_checker = 1
function! ToggleErrors()
    if empty(filter(tabpagebuflist(), 'getbufvar(v:val, "&buftype") is# "quickfix"'))
         " No location/quickfix list shown, open syntastic error location panel
         Errors
    else
        lclose
    endif
endfunction
map E :call ToggleErrors()<cr>
