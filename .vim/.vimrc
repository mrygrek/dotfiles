set pastetoggle=<F5>

" Colorscheme settings
set t_Co=256
colorscheme wombat256mod

" Ignore case while searching
set ignorecase
" Incremental search
set incsearch
" Highlight search results
set hlsearch

" Show command variants in command mode after Tab 
set wildmenu
" Line numbering
set number
set numberwidth=1
" Автоотступ
set autoindent
set smartindent

" Настройка табуляции
set tabstop=4
set shiftwidth=4
set smarttab
set et

" Backup and swap settings
set backupdir=/home/ygrek/.vim/backup,/tmp

" Включаем распознавание типов файлов и типо-специфичные плагины:
filetype on
filetype plugin on

" syntax-highlight
syntax on

" OmniCppComplete
" These are tags for omnicpp
"set tags+=/home/ygrek/.vim/tags/stl
"set tags+=/home/ygrek/.vim/tags/qt

"let OmniCpp_NamespaceSearch = 1
"let OmniCpp_GlobalScopeSearch = 1
"let OmniCpp_ShowAccess = 1
"let OmniCpp_MayCompleteDot = 1
"let OmniCpp_MayCompleteArrow = 1
"let OmniCpp_MayCompleteScope = 1
"let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

" latex-suite issue
let g:tex_flavor='tex'

" Use the same symbols as TextMate for tabstops and EOLs
"set listchars=tab:▸\ ,eol:¬

" Вводить команды можно и не переключаясь в английскую раскладку
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
"set keymap=russian-jcukenwin
"set iminsert=0
"set imsearch=0
"highlight lCursor guifg=NONE guibg=Cyan

""" Mappings  """
"Open NERDTree 
map <c-j>o :NERDTree<cr>

" Abbreviations for dealing with several splits
ab Q qall
ab W wall


" build tags of your own project with CTRL+F12
"map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
noremap <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>
inoremap <F12> <Esc>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>

" New tab
"noremap <C-t> :tabnew<cr>

" Switch tabs
"noremap <C-n> :tabn<cr>
"noremap <C-p> :tabp<cr>
