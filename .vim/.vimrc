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
" Autoindent settings
set autoindent
set smartindent

" Tab settings
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

" Backup and swap settings
set backupdir=/home/ygrek/.vim/backup
set directory=/home/ygrek/.vim/tmp

" syntax-highlight
syntax enable

" Abbreviations for dealing with several splits
abbreviate Q qall
abbreviate W wall

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

" ------------------------------------------------------------------
" Vim-latexsuite settings
" ------------------------------------------------------------------
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Entering commands in cyrillic keyboard layout
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

" ------------------------------------------------------------------
" NERDTree settings
" ------------------------------------------------------------------
"Open hotkey 
map <c-j>o :NERDTree<cr>

" build tags of your own project with CTRL+F12
"map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
noremap <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>
inoremap <F12> <Esc>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>

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
" <F5> switches between light and dark background modes and resets the colorscheme 
call togglebg#map("<F5>")

" ------------------------------------------------------------------
" Colorscheme settings
" ------------------------------------------------------------------
set t_Co=256
set background=light
colorscheme solarized

" ------------------------------------------------------------------
" Auto close pair of characters. Plugin vim-autoclose required.
" ------------------------------------------------------------------
let g:AutoClosePairs = {'<': '>', '(': ')', '[': ']', '{': '}', "'": "'", '"': '"'}
