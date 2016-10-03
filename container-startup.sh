#!/bin/bash

# VNC server environment: set password
VNCPASS=1234
mkdir ~/.vnc
x11vnc -storepasswd "$VNCPASS" ~/.vnc/passwd

# Virtual X server
/usr/bin/xvfb-run -n 99 -s "-screen 0 1024x768x24" bash

# X11 environment, window manager, notebook start
DISPLAY=:99
ratpoison &

# Start notebook server
xterm -e '/usr/local/bin/jupyter-notebook --no-browser --ip=0.0.0.0 --notebook-dir=/mnt/notebooks'

# VNC server
x11vnc --usepw --forever
