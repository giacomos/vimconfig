" http://vim.wikia.com/wiki/Mapping_keys_in_Vim_-_Tutorial_%28Part_1%29
" :nmap - Display normal mode maps
" :imap - Display insert mode maps
" :vmap - Display visual and select mode maps
" :smap - Display select mode maps
" :xmap - Display visual mode maps
" :cmap - Display command-line mode maps
" :omap - Display operator pending mode maps

" Inpired by https://github.com/tony/vim-config/blob/master/keymappings.vim


let mapleader="\\"             " Change leader to a \


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

" Closes all windows
nnoremap <silent> <C-d> :qa<cr>

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
nmap <A-k> ddkP
nmap <A-j> ddp

" Use <leader>l to toggle display of whitespace
nnoremap <leader>t :%s/\s\+$//<CR>
nnoremap H :set cursorline! cursorcolumn!<CR>
" Toggle line numbers and fold column for easy copying:
nnoremap <silent> <F6> :set nonumber!<CR>:set foldcolumn=0<CR>
nnoremap <silent> <F7> :set list!<CR>
cmap w!! %!sudo tee > /dev/null %
nmap <leader>c m`b~``<CR>

" Fold all code
nnoremap <space> za
" Fold this class/method
vnoremap <space> zf

" Jump to next location list entry, used by syntastic for error listing
nnoremap <silent> <leader>[ :lr<cr>
nnoremap <silent> <leader>] :lnext<cr>

" More natural movement between window splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
