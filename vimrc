set nocompatible                " enable all features. This must be first, because it changes other options as a side effect.
" set autoindent                  " guess indentation
set autowrite                   " write before hiding a buffer
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set backupdir=~/.tmp            " set the default directory for backup files (*~)
set bg=dark                     " we use a dark background, don't we?
set completeopt=menuone,longest " Always show the menu, insert longest match
set colorcolumn=80              " colorize the N column
set cursorline                  " this will highlight the current line
set cursorcolumn                " this will highlight the current column
set expandtab                   " spaces instead of tabs
set gcr=n:blinkon0              " disable cursor blinking
set history=1000                " keep 1000 lines of command line history
set visualbell                  " No sounds
set autoread                    " Reload files changed outside vim
set hlsearch                    " highlight the searchterms
set ignorecase                  " ignore case while searching
set incsearch                   " jump to the matches while typing
set laststatus=2                " Always display a status line at the bottom of the window
set number                      " show line numbers
set ruler                       " show the cursor position all the time
set showcmd                     " display incomplete commands
set showmatch                   " show matching braces
set textwidth=0                 " don't wrap words
set undolevels=1000             " 1000 undo levels
set wildchar=<Tab>              " Expand the command line using tab
set wildmenu
set list
set pastetoggle=<F2>
" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
colorscheme wombat256mod       " set default colorscheme
let mapleader="\\"             " Change leader to a \

" =============== Vundle Initialization ===============
" This loads all the plugins specified in ~/.vim/vundles.vim
" Use Vundle plugin to manage all other plugins
if filereadable(expand("~/.vim/vundles.vim"))
  source ~/.vim/vundles.vim
endif

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
"if has('persistent_undo')
"  silent !mkdir ~/.vim/backups > /dev/null 2>&1
"  set undodir=~/.vim/backups
"  set undofile
"endif

" ================ Indentation ======================

" set autoindent
" set smartindent
set smarttab
set shiftwidth=4                " (Auto)indent uses 4 characters
set softtabstop=2
set tabstop=4                   " Tabs are 4 characters
set expandtab

filetype plugin on
filetype indent off

set listchars=tab:▸\ ,eol:¬,trail:·     " Use the same symbols as TextMate for tabstops and EOLs

set nowrap                      " Don't wrap lines that are too long
set linebreak                   " Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default


" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ==================================================

syntax on "turn on syntax highlighting
" set paste
set noautoindent
" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-snippets config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Snippets variables
let g:snips_author='Giacomo Spettoli'
let g:author='Giacomo Spettoli'
let g:snips_email= 'giacomo.spettoli@gmail.com'
let g:email='giacomo.spettoli@gmail.com'
let g:snips_github='https://github.com/giacomos'
let g:github='https://github.com/giacomos'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntastic config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_enable_signs=1
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_jump=0 " 0: no jump, 1: always jump, 2: jump on errors
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_checker_args='--ignore=E501,E225'
let g:syntastic_python_flake8_args = '--ignore=E501,E123,E702,E231'
" Use jshint (uses ~/.jshintrc)
let g:syntastic_javascript_checkers = ['jshint']
" Better :sign interface symbols
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Powerline setup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"filetype off                   " required!
set laststatus=2
set encoding=utf-8
set t_Co=256  " this enables 256 colors
let g:Powerline_symbols = 'fancy'
let g:Powerline_theme='short'
let g:Powerline_colorscheme='solarized256_dark'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


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


" " Turn on code checking
" let g:pymode = 1
" " let g:pymode_rope = 1
" " Check code on every save (every)
" let g:pymode_lint_unmodified = 1
" " let g:pymode_lint_on_write = 1
" " Show error message if cursor placed at the error line
" let g:pymode_lint_message = 1
"
" " Documentation
" let g:pymode_doc = 1
" let g:pymode_doc_key = 'K'
"
" "Linting
" let g:pymode_lint = 1
" " Default code checkers (you could set several) *'g:pymode_lint_checkers'*
" let g:pymode_lint_checkers = ['flake8', 'pyflakes', 'pep8', 'mccabe', 'pylint']
" " Auto check on save
" let g:pymode_lint_write = 1
"
" " Support virtualenv
let g:pymode_virtualenv = 1
"
" " Enable breakpoints plugin
" let g:pymode_breakpoint = 1
" let g:pymode_breakpoint_key = '<leader>b'
"
" " syntax highlighting
" let g:pymode_syntax = 1
" let g:pymode_syntax_all = 1
" let g:pymode_syntax_indent_errors = g:pymode_syntax_all
" let g:pymode_syntax_space_errors = g:pymode_syntax_all
" " Don't autofold code
" let g:pymode_folding = 0
" " Enable pymode indentation
" let g:pymode_indent = 1
" " Option: g:pymode_lint_config -- str. Path to pylint config file
" let g:pymode_lint_config = '/home/jack/.pylintrc'
" " OPTION: g:pymode_lint_ignore -- string. Skip errors and warnings (e.g. " E4,W)
" let g:pymode_lint_ignore = "W0201"

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
source /home/jack/.vim/bundle/vim-flake8/ftplugin/python_flake8.vim
" autocmd BufWritePost *.py call Flake8()
let g:flake8_builtins="_,apply"
let g:flake8_ignore="E501,E128,E702"
let g:flake8_max_complexity=10
map <leader>g :GundoToggle<CR>

"" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir,
    'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

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

