set nocompatible                " enable all features. This must be first, because it changes other options as a side effect.
" set autoindent                  " guess indentation
set autowrite                   " write before hiding a buffer
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set backupdir=~/.tmp            " set the default directory for backup/swap files (*~)
set noswapfile                  " do not use swap files!
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
set wildmenu                    " Show list instead of just completing

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

"filetype plugin indent on " enable indent plugin

" Fold using markers {{{
" like this
" }}}
"set foldmethod=marker

"set statusline=[%02n]\ %f\ %(\[%M%R%H]%)%=\ %4l,%02c%2V\ %P%*
set statusline=%F%m%r%h%w\ %y\ [row=%l/%L]\ [col=%02v]\ [%02p%%]\

set list
set pastetoggle=<F2>
"colorscheme molokai       " set default colorscheme

" colorscheme wells-colors
colorscheme Revolution
