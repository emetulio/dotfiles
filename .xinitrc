#!/bin/sh

DEFAULT_SESSION=notion

case $1 in
openbox-session)
	exec /bin/bash -login /etc/X11/Xsession openbox-session
	;;

*)
    export DE=notion
    /usr/bin/xbacklight -set 20
    /usr/bin/trayer --widthtype request &
    eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg) &
    /usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
    #/usr/bin/xdg-user-dirs-gtk-update &
    #xdg-user-dirs-update
    /usr/bin/start-pulseaudio-x11 &
    /usr/bin/volumeicon &
    #/usr/bin/setxkbmap latam &
    #/usr/bin/xbindkeys&
    #/usr/bin/autokey-gtk &
    /usr/bin/xscreensaver -no-splash &
    /usr/bin/nm-applet &
    /usr/bin/clipit &
    /usr/bin/xset r rate 250 25 &
    /usr/bin/xset b off &
    /usr/bin/conky -d
    #/home/mta/bin/dropbox.py start &
    exec dbus-launch --exit-with-session notion
    #exec ck-launch-session dbus-launch notion
    ;;
esac
