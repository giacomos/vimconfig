" Don't reset twice on reloading - 'compatible' has SO many side effects.
if !exists('s:loaded_my_vimrc')
  source ~/.vim/bundles.vim
  source ~/.vim/keymappings.vim
  source ~/.vim/settings.vim
  source ~/.vim/autocmd.vim

  for fpath in split(globpath('~/.vim/settings/', '*.vim'), '\n')
    exe 'source' fpath
  endfor
  source ~/.vim/ignore.vim

  if filereadable(expand("~/.vim/local.vim"))
    source ~/.vim/local.vim
  endif

endif

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
"if has('persistent_undo')
"  silent !mkdir ~/.vim/backups > /dev/null 2>&1
"  set undodir=~/.vim/backups
"  set undofile
"endif

" change cursor color in insert-mode
if &term =~ '^screen'
   let &t_SI = "\<Esc>]12;red\x7"
   let &t_EI = "\<Esc>]12;white\x7"
endif

" Show the differences between the current buffer and the original opened file
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
"  set hlsearch
endif

"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
highlight Search ctermfg=154

" autocmd BufWritePost *.py call Flake8()
let g:flake8_builtins="_,apply"
let g:flake8_ignore="E501,E128,E702"
let g:flake8_max_complexity=10
map <leader>g :GundoToggle<CR>

" "" Add the virtualenv's site-packages to vim path
" py << EOF
" import os.path
" import sys
" import vim
" if 'VIRTUAL_ENV' in os.environ:
"     project_base_dir = os.environ['VIRTUAL_ENV']
"     sys.path.insert(0, project_base_dir)
"     activate_this = os.path.join(project_base_dir,
"     'bin/activate_this.py')
"     execfile(activate_this, dict(__file__=activate_this))
" EOF

if &term =~ '^screen'
    " tmux will send xterm-style keys when xterm-keys is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

" add zpt highlight
au BufNewFile,BufRead *.pt set filetype=html.pt
au BufNewFile,BufRead *.zcml set filetype=xml.zcml

augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%80v.*/
    autocmd FileType python set nowrap
augroup END

if !exists('s:loaded_my_vimrc')
  let s:loaded_my_vimrc = 1
endif
