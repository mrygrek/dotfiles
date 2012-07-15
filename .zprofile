#
# Logging into tmux when in ttyX
#
vico="$(tty | grep -oE ....$)"

case "$vico" in
    tty1) exec /home/ygrek/bin/tmux_startup.sh
    ;;
esac
