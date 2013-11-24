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

# grep output coloring
export GREP_COLOR="5;33;40"
export GREP_OPTIONS="-i --color=auto"
# # редактор по дефолту
export EDITOR=/usr/bin/vim
# add custom scripts location to PATH
export PATH="$PATH:$HOME/bin"
# set /usr/local/bin at the beginning of the PATH on *BSD
if [[ -d /usr/local/bin ]]; then
    export PATH=`echo $PATH | sed 's/\(^.*\)\(\/usr\/local\/bin\:\)\(.*$\)/\2\1\3/g'`
fi
if [[ -d /usr/local/opt/ruby/bin ]]; then
    export PATH="$PATH:/usr/local/opt/ruby/bin"
fi
# # точка монтирования iPod Shuffle
export IPOD_MOUNTPOINT=/media/CRUMB

#Опции less
export LESS='-R -S'

# # забыл зачем ставил
export LESSCHARSET=UTF-8

# LS output and completion coloring
#  if solarized scheme for dircolors is present, use it
#  link: https://github.com/seebi/dircolors-solarized
if [[ -f $HOME/.colors/dircolors-solarized/dircolors.ansi-dark ]]; then
    COLOR_ARGS="$HOME/.colors/dircolors-solarized/dircolors.ansi-dark"
else
    COLOR_ARGS='-b'
fi

if [[ $OSTYPE == 'darwin13.0' ]]; then
    export CLICOLOR=1
    eval $(gdircolors $COLOR_ARGS)
elif [[ $OSTYPE == 'linux-gnu' ]]; then
    eval $(dircolors $COLOR_ARGS)
fi

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

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
zstyle ':completion:*:expand:*' tag-order commands functions #all-expansions
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

# ZSH completions path
# to re-initialize completions execute:
#   $ rm -f ~/.zcompdump; compinit
fpath=(/usr/local/share/zsh-completions $fpath)

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
