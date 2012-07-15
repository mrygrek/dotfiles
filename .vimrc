set nocompatible               " be iMproved
filetype off                   " required!
 
set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()
 
" install Vundle
"     git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

" let Vundle manage Vundle.    " required! 
Bundle 'gmarik/vundle'

Bundle 'https://github.com/altercation/vim-colors-solarized.git'
Bundle 'https://github.com/scrooloose/nerdtree.git'
Bundle 'git://github.com/Townk/vim-autoclose'

filetype plugin indent on     " required!"

source $HOME/.vim/.vimrc
