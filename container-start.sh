#!/bin/bash
#

# Set defaults, allow overrides by setting these in docker -e environment variables.
: ${SET_VNC_PASS:=1234}
: ${X11_DISPLAY_NO:=99}
: ${X11_DISPLAY_GEOMETRY:=1024x768x24}

# VNC server environment: set password
mkdir ~/.vnc
x11vnc -storepasswd "$SET_VNC_PASS" ~/.vnc/passwd

# Virtual X server
/usr/bin/xvfb-run -n "$X11_DISPLAY_NO" -s "-screen 0 $X11_DISPLAY_GEOMETRY" "/opt/xsession-start.sh"
