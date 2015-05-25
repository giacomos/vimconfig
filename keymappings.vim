" Inpired by https://github.com/tony/vim-config/blob/master/keymappings.vim
let mapleader="\\"             " Change leader to a \


" <Leader>2: Toggle Tagbar
nnoremap <silent> <Leader>2 :TagbarToggle<cr>

" <Leader>4: Toggle between paste mode
nnoremap <silent> <leader>4 :set paste!<cr>

" Show line numbers
" http://jeffkreeftmeijer.com/2012/relative-line-numbers-in-vim-for-super-fast-movement/
function! NumberRelativeToggle()
  if(&relativenumber == 0 && &number == 0)
    echo "Line numbers not enables, use <leader>7 or :set number / :set relativenumber to enable"
  elseif(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

nnoremap <silent> <leader>6 :call NumberRelativeToggle()<CR>

" <Leader>p: Copy the full path of the current file to the clipboard
nnoremap <silent> <Leader>p :let @+=expand("%:p")<cr>:echo "Copied current file
      \ path '".expand("%:p")."' to clipboard"<cr>

" Q: Closes the window
nnoremap Q :qa<cr>

" Tab: Indent
xmap <Tab> >

" shift-tab: unindent
xmap <s-tab> <

map ;] :bnext<CR>
map ;[ :bprev<CR>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Switch line with the one above or below
nmap <C-Up> ddkP
nmap <C-Down> ddp
" Easier window movement using ALT+<arrows>
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
" Use <leader>l to toggle display of whitespace
nmap <leader>l :set list!<CR>
nnoremap <leader>t :%s/\s\+$//<CR>
nnoremap H :set cursorline! cursorcolumn!<CR>
" Toggle line numbers and fold column for easy copying:
nnoremap N :set nonumber!<CR>:set foldcolumn=0<CR>
cmap w!! %!sudo tee > /dev/null %
nmap <leader>c m`b~``<CR>
