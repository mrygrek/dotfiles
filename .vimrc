set nocompatible               " be iMproved
filetype off                   " required!
 
set runtimepath+=$HOME/.config/vim/bundle/vundle/
call vundle#rc()
 
" install Vundle
"     git clone https://github.com/gmarik/vundle.git ~/.config/vim/bundle/vundle

" let Vundle manage Vundle.    " required! 
Bundle 'gmarik/vundle'

Bundle 'https://github.com/altercation/vim-colors-solarized.git'
Bundle 'https://github.com/scrooloose/nerdtree.git'
Bundle 'https://github.com/Townk/vim-autoclose'
Bundle 'https://github.com/Lokaltog/vim-powerline'
Bundle 'https://github.com/kien/ctrlp.vim'
Bundle 'https://github.com/plasticboy/vim-markdown.git'

filetype plugin indent on     " required!"

source $HOME/.config/vim/.vimrc
