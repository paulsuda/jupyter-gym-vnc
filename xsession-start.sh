#!/bin/bash
#
# This is run by the X11 server created when container-stat.sh runs.
#

: ${X11_WINDOW_MANAGER:=ratpoison}
: ${NOTEBOOK_PATH:=/mnt/notebooks}

# Add window manager to X session.
$X11_WINDOW_MANAGER &

# Start notebook inside an xterm in the session.
xterm -e jupyter notebook --no-browser --ip=0.0.0.0 --port=8888 --notebook-dir="$NOTEBOOK_PATH" &

# Attach as client to session with VNC server.
x11vnc --usepw --forever
