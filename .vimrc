" set autoindent                  " guess indentation
set autowrite                   " write before hiding a buffer
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set backupdir=~/.tmp            " set the default directory for backup files (*~)
set bg=dark                     " we use a dark background, don't we?
set completeopt=menuone,longest " Always show the menu, insert longest match
set colorcolumn=81              " colorize the N column
set cursorline                  " this will highlight the current line
set cursorcolumn                " this will highlight the current column
set expandtab                   " spaces instead of tabs
set gcr=n:blinkon0              " disable cursor blinking
set history=100                 " keep 50 lines of command line history
set hlsearch                    " highlight the searchterms
set ignorecase                  " ignore case while searching
set incsearch                   " jump to the matches while typing
set laststatus=2                "Always display a status line at the bottom of the window
set listchars=tab:▸\ ,eol:¬     " Use the same symbols as TextMate for tabstops and EOLs
set nocompatible                " enable all features
set nowrap                      " Wrap too long lines
set number                      " show line numbers
set ruler                       " show the cursor position all the time
set shiftwidth=4                " (Auto)indent uses 4 characters
set showcmd                     " display incomplete commands
set showmatch                   " show matching braces
set tabstop=4                   " Tabs are 4 characters
set textwidth=0                 " don't wrap words
set undolevels=1000             " 1000 undo levels
set wildchar=<Tab>              " Expand the command line using tab
set wildmenu
colorscheme wombat256mod       " set default colorscheme

syntax on
"set paste
set noautoindent
" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

"" change cursor color in insert-mode
"if &term =~ "xterm"
"    let &t_SI = "\<Esc>]12;orange\x7"
"    let &t_EI = "\<Esc>]12;white\x7"
"endif

" Show the differences between the current buffer and the original opened file
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
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

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
"  filetype plugin indent on

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
endif " has("autocmd")

"filetype plugin indent on " enable indent plugin

" Fold using markers {{{
" like this
" }}}
"set foldmethod=marker
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
 autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif


" map T :TlistToggle<CR> 
" add a mapping to NerdTree to SHIFT-n
map B :NERDTreeToggle<CR>

"set statusline=[%02n]\ %f\ %(\[%M%R%H]%)%=\ %4l,%02c%2V\ %P%*
set statusline=%F%m%r%h%w\ %y\ [row=%l/%L]\ [col=%02v]\ [%02p%%]\ 

" highlight char after the 80 column
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" if exists('+colorcolumn')
"    set colorcolumn=81
" else
  highlight OverLength ctermbg=blue ctermfg=white guibg=#592929
  match OverLength /\%81v.\+/
  highlight ColorColumn ctermbg=DarkGray ctermfg=154
"endif

" add zpt highlight
au BufNewFile,BufRead *.pt set filetype=xml
au BufNewFile,BufRead *.less set filetype=less


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VUNDLE CONFIG
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here (original repos on github):
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'scrooloose/nerdtree'
Bundle 'klen/python-mode'
Bundle 'airblade/vim-gitgutter'
Bundle 'gmarik/sudo-gui.vim'
" snipMate  https://github.com/garbas/vim-snipmate
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"
"Bundle "zedr/zope-snipmate-bundle"
" Bundle "vim-scripts/snippetsEmu"
Bundle "sjl/gundo.vim"
Bundle "PotatoesMaster/i3-vim-syntax"
" Bundle 'stephenmckinney/vim-solarized-powerline'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%80v.*/
    autocmd FileType python set nowrap
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Powerline setup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"filetype off                   " required!
set laststatus=2
set encoding=utf-8
set t_Co=256
let g:Powerline_symbols = 'fancy'
let g:Powerline_theme='short'
let g:Powerline_colorscheme='solarized256_dark'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 1

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "flake8,pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
" Don't autofold code
let g:pymode_folding = 0
" Enable pymode indentation
let g:pymode_indent = 1

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
map <F3> :NERDTreeToggle<CR>
nnoremap H :set cursorline! cursorcolumn!<CR>
" Toggle line numbers and fold column for easy copying:
nnoremap N :set nonumber!<CR>:set foldcolumn=0<CR>
cmap w!! %!sudo tee > /dev/null %

"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
highlight Search ctermfg=154

:nmap <leader>c m`b~``<CR>
let g:flake8_builtins="_,apply"
source /home/jack/.vim/bundle/vim-flake8/ftplugin/python_flake8.vim
autocmd BufWritePost *.py call Flake8()
let g:flake8_ignore="E501,E128,E702"
let g:flake8_max_complexity=10
map <leader>g :GundoToggle<CR>
