#!/bin/bash

: ${X11_WINDOW_MANAGER:=ratpoison}
: ${NOTEBOOK_PATH:=/mnt/notebooks}

# X11 environment, window manager, notebook start
$X11_WINDOW_MANAGER &

# Start notebook server
xterm -e jupyter notebook --no-browser --ip=0.0.0.0 --port=8888 --notebook-dir="$NOTEBOOK_PATH" &

# VNC server
x11vnc --usepw --forever
