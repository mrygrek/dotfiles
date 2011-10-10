# # Папка для различных файлов конфигурации
ZDIR=~/.config/zsh

# # Настраиваем клавиши
source $ZDIR/zsh_keys

# # Алиасы
source $ZDIR/zsh_aliases
source $ZDIR/zsh_functions

# # файл истории команд
HISTFILE=~/.zhistory
# # Число команд, сохраняемых в HISTFILE
HISTSIZE=1000
SAVEHIST=1000

# # Use hard limits, except for a smaller stack and no core dumps
unlimit
limit stack 1024
limit core 0
limit -s
# # Установка аттрибутов доступа для вновь создаваемых файлов
umask 022

cdpath=( . ~ )

# # переменные окружения

#оформим подсветку в grep
export GREP_COLOR="1;33"
# # редактор по дефолту
export EDITOR=/usr/bin/vim
# # пути где искать бинарники
export PATH="$PATH:/home/ygrek/bin"

# # точка монтирования iPod Shuffle
export IPOD_MOUNTPOINT=/media/CRUMB

# # ООо и русские имена файлов
# задается в /etc/profile.d/openoffice.sh

# # забыл зачем ставил
export LESSCHARSET=UTF-8
#разукрашиваем ls и автодополнение
export LS_COLORS='no=00;37:fi=00;37:di=01;36:ln=04;36:pi=33:so=01;35:do=01;35:bd=33;01:cd=33;01:or=31;01:su=37:sg=30:tw=30:ow=34:st=37:ex=01;31:*.cmd=01;31:*.exe=01;31:*.com=01;31:*.btm=01;31:*.sh=01;31:*.run=01;31:*.tar=33:*.tgz=33:*.arj=33:*.taz=33:*.lzh=33:*.zip=33:*.z=33:*.Z=33:*.gz=33:*.bz2=33:*.deb=33:*.rpm=33:*.jar=33:*.rar=33:*.jpg=32:*.JPG=32:*.JPEG=32:*.jpeg=32:*.gif=32:*.bmp=32:*.pbm=32:*.pgm=32:*.ppm=32:*.tga=32:*.xbm=32:*.xpm=32:*.tif=32:*.tiff=32:*.png=32:*.mov=34:*.mpg=34:*.mpeg=34:*.avi=34:*.fli=34:*.flv=34:*.3gp=34:*.mp4=34::*.mkv=34:*.divx=34:*.gl=32:*.dl=32:*.xcf=32:*.xwd=32:*.flac=35:*.mp3=35:*.mpc=35:*.ogg=35:*.wav=35:*.m3u=35:';
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# Further enhance the colored ls output; for example, broken (orphan) symlinks will start showing in a red hue. 
eval $(dircolors -b)
#Опции less
export LESS='-R -S'
#
# # значение цветов            #30 черный текст            #40 черный фон
#00 восстановление цвета по умолчанию    #31 красный текст            #41 красный фон
#01 включить яркие цвета        #32 зеленый текст            #42 зеленый фон
#04 подчеркнутый текст            #33 желтый (или коричневый) текст    #43 желтый (или коричневый) фон
#05 мигающий текст            #34 синий текст                #44 синий фон
# # ну или color юзать            #35 фиолетовый текст            #45 фиолетовый фон
##                  #36 cyan текст                #46 cyan фон
##                     #37 белый (или серый) текст        #47 белый (или серый) фон
#
# # Shell functions
setenv() { typeset -x "${1}${1:+=}${(@)argv[2,$#]}" } # csh compatibility
freload() { while (( $)); do; unfunction $1; autoload -U $1; shift; done }
# # Autoload zsh modules when they are referenced
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
zmodload -ap zsh/mapfile mapfile
#
# # Completions
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate
zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'
zstyle ':completion:*:expand:*' tag-order all-expansions
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?.o' '*?.c~''*?.old' '*?.pro'
zstyle ':completion:*:functions' ignored-patterns '_*'
# # менюшку нам для астокомплита
zstyle ':completion:*' menu yes select
#
# # различные опции шелла
#
# # Позволяем разворачивать сокращенный ввод, к примеру cd /u/sh в /usr/share
autoload -U compinit && compinit
# # не пищать при дополнении или ошибках
setopt NO_BEEP
# # если набрали путь к директории без комманды CD, то перейти
setopt AUTO_CD
# # исправлять неверно набранные комманды
setopt CORRECT_ALL
# # включает поддержку комментариев в командной строке
setopt INTERACTIVECOMMENTS
# # zsh будет обращаться с пробелами так же, как и bash
setopt SH_WORD_SPLIT
# # последние комманды в начале файла и не хранить дубликаты
setopt histexpiredupsfirst histfindnodups histignoredups
setopt appendhistory histnostore histverify histignorespace extended_history share_history
# # Установка и снятие различных опций шелла
setopt notify pushdtohome cdablevars autolist
setopt autocd longlistjobs
setopt autoresume pushdsilent noclobber
setopt autopushd pushdminus extendedglob rcquotes mailwarning
unsetopt bgnice autoparamslash
# #
# #
setopt autolist
setopt menucomplete
#
# # автоматическое удаление одинакового из этого массива
typeset -U path cdpath fpath manpath
# # загружаем список цветов
autoload colors && colors
# # предустановленная тема prompt
autoload -U promptinit
promptinit
prompt adam2 #walters 
# # вопрос на автокоррекцию
SPROMPT='zsh: Заменить '\''%R'\'' на '\''%r'\'' ? [Yes/No/Abort/Edit] '
# # симпотное добавления для kill
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=$color[cyan]=$color[red]"
#
typeset -g -A key
#
# # экранируем спецсимволы в url, например &, ?, ~ и так далее
autoload -U url-quote-magic
zle -N self-insert url-quote-magic
#
# # куда же мы без калькулятора
autoload -U zcalc

# UNIX-socket для urxvt
export RXVT_SOCKET=/tmp/.rxvt.socket
