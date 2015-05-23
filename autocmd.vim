" Inspired by https://github.com/tony/vim-config/blob/master/autocmd.vim

"===============================================================================
" Autocommands
"===============================================================================
" Set augroup
augroup MyAutoCmd
  autocmd!
augroup END


" Turn on cursorline only on active window
augroup MyAutoCmd
  autocmd WinLeave * setlocal nocursorline
  autocmd WinLeave * setlocal nocursorcolumn
  autocmd WinEnter,BufRead * setlocal cursorline
  autocmd WinEnter,BufRead * setlocal cursorcolumn
augroup END

if has("autocmd")
  " json = javascript syntax highlight
  autocmd MyAutoCmd FileType json setlocal syntax=javascript
  
  autocmd FileType html,xhtml,xml,htmldjango,jinja.html,jinja,eruby,mako setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" Colorcolumns
  if version >= 730
    autocmd FileType * setlocal colorcolumn=0
    autocmd FileType ruby,python,javascript,c,cpp,objc setlocal colorcolumn=79
  endif

  " vim
  " ---
  autocmd FileType vim setlocal expandtab shiftwidth=2 tabstop=8 softtabstop=2

  " CSS
  " ---
  autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
  augroup END


  " Start NERDTree
  autocmd VimEnter * NERDTree
  " Go to previous (last accessed) window.
  autocmd VimEnter * wincmd p

endif " has("autocmd")
