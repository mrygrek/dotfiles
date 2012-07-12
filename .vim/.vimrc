" 99-th line highlighting
highlight ColorColumn ctermbg=Cyan
set colorcolumn=99
" Highlighting for current line
highlight CurrentLineNr ctermbg=DarkCyan
set cursorline

set pastetoggle=<F4>

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
set expandtab

" Backup and swap settings
set backupdir=/home/ygrek/.vim/backup
set directory=/home/ygrek/.vim/tmp
" Path for runtime commands
set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME ",$VIM/vimfiles/after,~/.vim/a

" Включаем распознавание типов файлов и типо-специфичные плагины:
filetype on
filetype plugin on

" syntax-highlight
syntax enable

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

" ------------------------------------------------------------------
" Vim-latexsuite settings
" ------------------------------------------------------------------
filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Вводить команды можно и не переключаясь в английскую раскладку
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
highlight lCursor guifg=NONE guibg=Cyan

""" Mappings  """
"Open NERDTree 
map <c-j>o :NERDTree<cr>

" Abbreviations for dealing with several splits
abbreviate Q qall
abbreviate W wall


" build tags of your own project with CTRL+F12
"map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
noremap <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>
inoremap <F12> <Esc>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>

" New tab
"noremap <C-t> :tabnew<cr>

" Switch tabs
"noremap <C-n> :tabn<cr>
"noremap <C-p> :tabp<cr>

" ------------------------------------------------------------------
" Solarized Colorscheme Config
" ------------------------------------------------------------------
"let g:solarized_termtrans=0
"let g:solarized_degrade=0
"let g:solarized_bold=1
"let g:solarized_underline=1
"let g:solarized_italic=1
"let g:solarized_termcolors=256
let g:solarized_contrast="normal"
let g:solarized_visibility="low"
let g:solarized_diffmode="normal"
"let g:solarized_hitrail=0
"let g:solarized_menu=1

" ------------------------------------------------------------------
" Colorscheme settings
" ------------------------------------------------------------------
set t_Co=256
set background=dark
colorscheme solarized

"
" Auto close pair of characters 
"
let g:AutoClosePairs = {'<': '>', '(': ')', '[': ']', '{': '}', "'": "'", '"': '"'}
