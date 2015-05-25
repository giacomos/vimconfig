" bundles.vim credit: https://github.com/klen/.vim/blob/master/bundle.vim

set nocompatible
filetype off

" Setting up Vundle - the vim plugin bundler
" Credit:  http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
let iCanHazNeoBundle=1
let neobundle_readme=expand('~/.vim/bundle/neobundle.vim/README.md')
if !filereadable(neobundle_readme)
  echo "Installing neobundle.vim."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
  let iCanHazNeoBundle=0
endif

set rtp+=~/.vim/bundle/neobundle.vim/

call neobundle#begin(expand('~/.vim/bundle/'))


" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile

let g:make = 'gmake'
if system('uname -o') =~ '^GNU/'
  let g:make = 'make'
endif

NeoBundle 'Shougo/vimproc', { 'build': {
      \   'windows' : 'tools\\update-dll-mingw',
      \   'cygwin': 'make -f make_cygwin.mak',
      \   'mac': 'make -f make_mac.mak',
      \   'unix': g:make,
      \ } }


if executable('go')
  NeoBundleLazy "nsf/gocode", {
        \ 'autoload': {'filetypes': ['go']}
        \ }
  NeoBundleLazy "fatih/vim-go", {
        \ 'autoload': {'filetypes': ['go']}}
  NeoBundleLazy "jstemmer/gotags", {
        \ 'autoload': {'filetypes': ['go']}}
endif

if executable('ruby')
  NeoBundleLazy 'vim-ruby/vim-ruby', {
        \ 'autoload' : {
        \   'filetypes' : 'ruby',
        \ }}
  NeoBundleLazy 'tpope/rbenv-ctags', {
        \ 'autoload' : {
        \   'filetypes' : 'ruby',
        \ }}
  NeoBundleLazy 'tpope/vim-rbenv', {
        \ 'autoload' : {
        \   'filetypes' : 'ruby',
        \ }}
endif

" endwise.vim: wisely add "end" in ruby, endfunction/endif/more in vim script, etc
NeoBundleLazy 'tpope/vim-endwise'

" is all about surroundings: parentheses, brackets, quotes, XML tags, and more
NeoBundleLazy 'tpope/vim-surround'

NeoBundle 'terryma/vim-multiple-cursors'
"NeoBundleLazy 'tony/vim-multiple-cursors', { 'rev': 'quit-multiple-cursors' }


" Utils {{{
" =========
NeoBundleLazy 'vim-scripts/closetag.vim'  "  messes up python docstrings
" }}}


" Disable plugins for LargeFile
NeoBundleLazy 'vim-scripts/LargeFile'

" }}}


" Browse {{{
" ==========

" A tree explorer plugin for vim.
NeoBundleLazy 'scrooloose/nerdtree', {
      \ 'autoload' : {
      \    'commands': ['NERDTreeToggle', 'NERDTree', 'NERDTreeClose']
      \  }
      \}
NeoBundleLazy 'Xuyuanp/git-nerdtree', {
      \   "autoload" : {
      \       "commands" : ["NERDTreeToggle", "NERDTree", "NERDTreeClose"]
      \   }
      \}


" Find files
NeoBundle 'ctrlpvim/ctrlp.vim',
      \ {'autoload': {'commands': ['CtrlP', 'CtrlPBuffer', 'CtrlPMRU', 'CtrlPLastMode', 'CtrlPRoot', 'CtrlPClearCache', 'CtrlPClearAllCaches']}}
NeoBundleLazy 'tacahiroy/ctrlp-funky',
      \ {'autoload': {'commands': ['CtrlPFunky']}}
NeoBundle 'FelikZ/ctrlp-py-matcher', {
      \   'depends' : 'ctrlpvim/ctrlp.vim'
      \}

" Vim plugin that displays tags in a window, ordered by class etc.
NeoBundle "majutsushi/tagbar", {
      \ 'lazy': 1,
      \ 'autoload' : {'commands': 'TagbarToggle'}
      \}

" }}}



" Status line {{{
" ===============

" lean & mean statusline for vim that's light as air
NeoBundle 'bling/vim-airline'

" }}}


" Motion and operators {{{
" ========================

" }}}

NeoBundle 'MarcWeber/vim-addon-mw-utils'  " required by snipmate
NeoBundle 'tomtom/tlib_vim'  " required by snipmate
NeoBundle 'garbas/vim-snipmate'
NeoBundle 'honza/vim-snippets'

" Languages {{{
" =============
NeoBundleLazy 'klen/python-mode', {
      \ 'autoload' : {
      \   'filetypes' : 'python',
      \ }}

NeoBundleLazy 'sophacles/vim-bundle-mako', {
      \ 'autoload' : {
      \   'filetypes' : 'mako',
      \ }}

NeoBundleLazy 'google/yapf', {
      \ 'autoload' : {
      \   'filetypes' : 'python',
      \ },
      \ 'build': {
      \   'unix': 'pip install --user -e .',
      \ },
      \ 'rtd': "~/.vim/bundle/yapf/plugins",
      \ 'script_type': 'plugin'
      \ }


" NeoBundleLazy 'ehamberg/vim-cute-python', 'moresymbols', {
"     \ 'autoload': {
"     \   'filetypes': 'python',
"     \ },
"     \ 'disabled': !has('conceal'),
" \ }

"NeoBundleLazy 'tell-k/vim-autopep8', {
"      \ 'autoload' : {
"      \   'filetypes' : 'python',
"      \ }}

NeoBundleLazy 'PotatoesMaster/i3-vim-syntax', {
      \ 'autoload' : {
      \   'filetypes' : 'i3',
      \ }}

NeoBundleLazy 'Shutnik/jshint2.vim'

NeoBundleLazy 'ekalinin/Dockerfile.vim',
      \ {'autoload': {'filetypes': 'Dockerfile'}}
NeoBundle "Glench/Vim-Jinja2-Syntax"
NeoBundleLazy "mklabs/grunt", {
      \ 'autoload' : {
      \   'filetypes' : 'javascript',
      \ }}
NeoBundleLazy 'xolox/vim-lua-ftplugin' , {
      \ 'autoload' : {'filetypes' : 'lua'},
      \ 'depends' : 'xolox/vim-misc',
      \ }

NeoBundleLazy 'elzr/vim-json', {
      \ 'autoload' : {
      \   'filetypes' : 'javascript',
      \ }}
" indent yaml
NeoBundleLazy 'avakhov/vim-yaml', {
      \ 'autoload' : {
      \   'filetypes' : 'python',
      \ }}
NeoBundleLazy 'othree/html5-syntax.vim', {
      \ 'autoload' : {
      \     'filetypes' : ['html', 'xhtml', 'jst', 'ejs']
      \   }
      \ }
if executable('nginx')
  NeoBundleLazy 'evanmiller/nginx-vim-syntax', {'autoload': {'filetypes': 'nginx'}}
endif
NeoBundleLazy 'groenewege/vim-less', {
      \ 'autoload' : {
      \   'filetypes' : 'less',
      \ }
      \ }

" causes rst files to load slow...
" NeoBundleLazy 'skammer/vim-css-color', {
" \ 'autoload' : {
" \   'filetypes' : ['css', 'less']
" \ }}

NeoBundleLazy 'hail2u/vim-css3-syntax', {
      \ 'autoload' : {
      \   'filetypes' : ['css', 'less'],
      \ }}
NeoBundleLazy 'tpope/vim-markdown', {'autoload':{'filetypes':['markdown']}}
NeoBundleLazy 'nelstrom/vim-markdown-folding', {'autoload':{'filetypes':['markdown']}}

" }}}


" Syntax checkers {{{
" ===================
NeoBundleLazy 'scrooloose/syntastic', {
      \ 'autoload': {
      \   'insert': 1,
      \ }
      \ }
" }}}




" features
NeoBundleLazy 'nathanaelkane/vim-indent-guides' " color indentation

" NeoBundleLazy 'thinca/vim-quickrun'

" NeoBundleLazy 'scrooloose/nerdcommenter'
NeoBundle 'tomtom/tcomment_vim', {
      \ 'autoload' : {
      \   'commands' : [
      \     'TComment', 'TCommentAs', 'TCommentRight',
      \      'TCommentBlock', 'TCommentInline', 'TCommentMaybeInline',
      \ ]}}

NeoBundleLazy 'Rykka/riv.vim', {
      \ 'filetypes' : ['rst', 'python'],
      \ }
" https://github.com/Rykka/riv.vim/issues/42
NeoBundleLazy 'justinmk/vim-syntax-extra'

NeoBundleLazy 'Lokaltog/vim-easymotion'
NeoBundle 'CruizeMissile/Revolution.vim'



if executable('git')

  NeoBundleLazy 'airblade/vim-gitgutter'
  NeoBundle 'tpope/vim-fugitive', {
        \ 'autoload' : {'commands':
        \   ['Gwrite', 'Gcommit', 'Gmove', 'Ggrep', 'Gbrowse', 'Glog',
        \    'Git', 'Gedit', 'Gsplit', 'Gvsplit', 'Gtabedit', 'Gdiff',
        \    'Gstatus', 'Gblame'],
        \ }}

  NeoBundleLazy 'gregsexton/gitv', {
        \ 'autoload': {
        \   'commands': 'Gitv'
        \ }
        \}
endif

if iCanHazNeoBundle == 0
  echo "Installing Bundles, please ignore key map error messages"
  echo ""
  :NeoBundleInstall
endif
" Setting up Vundle - the vim plugin bundler end

call neobundle#end()


" Needed for Syntax Highlighting and stuff
filetype plugin indent on
syntax enable

" Installation check.
NeoBundleCheck
