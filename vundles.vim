"============================================
" Vundle configuration
"============================================
"
" This file contains the list of plugin installed using vundle plugin manager.
" Once you've updated the list of plugin, you can run vundle update by issuing
" the command :BundleInstall from within vim or directly invoking it from the
" command line with the following syntax:
" vim --noplugin -u vim/vundles.vim -N "+set hidden" "+syntax on" +BundleClean! +BundleInstall +qall
" Filetype off is required by vundle
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#rc('$HOME/.vim/bundle/')

" let Vundle manage Vundle, required
Bundle 'gmarik/Vundle.vim'

" My Bundles here (original repos on github):

" Bundle "vim-scripts/snippetsEmu"
" Bundle 'klen/python-mode'
" Bundle 'stephenmckinney/vim-solarized-powerline'
" snipMate  https://github.com/garbas/vim-snipmate
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "PotatoesMaster/i3-vim-syntax"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"
Bundle "scrooloose/syntastic"
Bundle "sjl/gundo.vim"
Bundle "tomtom/tlib_vim"
Bundle "zedr/zope-snipmate-bundle"
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'airblade/vim-gitgutter'
Bundle 'giacomos/zope-snipmate-bundle'
Bundle 'gmarik/sudo-gui.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'altercation/vim-colors-solarized'
Bundle 'zeis/vim-kolor'
Bundle 'tpope/vim-surround'  " is all about surroundings: parentheses, brackets, quotes, XML tags, and more
" Bundle 'wincent/Command-T'  " opening files and buffers with a minimal number of keystrokes
Bundle 'tmhedberg/SimpylFold'
Bundle 'sjl/gundo.vim'  " plugin to visualize your Vim undo tree

" All of your Plugins must be added before the following line
filetype plugin on
filetype indent off
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
