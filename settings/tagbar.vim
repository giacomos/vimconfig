let g:tagbar_autofocus = 0
let g:tagbar_compact = 1
let g:tagbar_width = 30
let g:tagbar_foldlevel = 1
let g:tagbar_type_rst = {
    \ 'ctagstype': 'rst',
    \ 'kinds': [ 'r:references', 'h:headers' ],
    \ 'sort': 0,
    \ 'sro': '..',
    \ 'kind2scope': { 'h': 'header' },
    \ 'scope2kind': { 'header': 'h' }
    \ }

" Toggle tagbar
nnoremap <silent> <F8> :TagbarToggle<CR>
