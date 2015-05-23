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
set nocompatible                " enable all features. This must be first, because it changes other options as a side effect.
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" My Bundles here (original repos on github):
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'PotatoesMaster/i3-vim-syntax'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/syntastic'
Plugin 'sjl/gundo.vim'
Plugin 'tomtom/tlib_vim'
Plugin 'zedr/zope-snipmate-bundle'
"Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'airblade/vim-gitgutter'
Plugin 'gmarik/sudo-gui.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'zeis/vim-kolor'
" is all about surroundings: parentheses, brackets, quotes, XML tags, and more
Plugin 'tpope/vim-surround'
" The Command-T plug-in provides an extremely fast, intuitive mechanism for opening files and buffers with a minimal number of keystrokes
Plugin 'wincent/Command-T'
Plugin 'tmhedberg/SimpylFold'
Plugin 'nvie/vim-flake8'
Plugin 'bling/vim-airline'
Bundle 'majutsushi/tagbar'
Bundle 'kien/ctrlp.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
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
