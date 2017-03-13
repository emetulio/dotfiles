# ~/.bash_profile: executed by bash(1) for non-login shells

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

if [[ -e ~/.bashrc ]]; then
    . ~/.bashrc
fi

