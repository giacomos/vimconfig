if neobundle#tap('vim-airline')
    let g:airline_theme="dark"
    let g:airline_powerline_fonts = 1
    let g:airline_detect_modified=1

    "Show buffer list
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#show_buffers = 1
    let g:airline#extensions#tabline#buffer_nr_show = 1
    let g:airline#extensions#tabline#show_tab_nr = 1
    let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
    let g:airline#extensions#tabline#buffer_min_count = 2
    let g:airline#extensions#tabline#left_sep = ''

endif
