" if neobundle#tap('nerdtree')
  " Highlight the selected entry in the tree
  nnoremap <silent> <F4> :NERDTreeToggle<cr>

  " function! neobundle#hooks.on_post_source(bundle)
    " Highlight the selected entry in the tree
    let NERDTreeHighlightCursorline=1

    let NERDTreeShowHidden=1

    let NERDTreeHijackNetrw=0

    " Use a single click to fold/unfold directories and a double click to open
    " files
    let NERDTreeMouseMode=2

    " let NERDTreeIgnore
    " See ignore.vim

    let g:NERDTreeWinSize = 31
  " endfunction

  " call neobundle#untap()
" endif
