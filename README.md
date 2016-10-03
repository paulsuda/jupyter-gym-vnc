
This is a Docker image that tries to make it as easy as possible to run the
OpenAI Gym environments in Jupyter notebooks from a self contained package.

 * Provides a VNC server on port 5900
 * Provides a Jupyter notebook server on port 8888
 * Reads notebooks from a volume mounted to /mnt/notebooks

Run the Open AI Gym and Jupyter right now with this one weird command line:
  docker run -ti psuda/jupyter-gym-vnc -p 18888:8888 -p 15900:5900 --volume=$HOME/notebooks:/mnt/notebooks

This builds on top of the b.gcr.io/tensorflow/tensorflow image to add the OpenAI
gym package, dependencies of OpenAI Gym, and a headless X11 environment. The X
server is rendered via x11vnc so that the graphical part of OpenAI Gym
can be viewed on any platform without X11 readily available.

This builds a Python 2 environment.

For OSX Users:
 * You should probably map VNC to a port that's not 5900, OSX runs service on that port by default.
 * Safari handles special VNC URLs, like [vnc://localhost:15900], with the OSX built in "Screen Sharing" app.

Build:
  docker build -t psuda/jupyter-gym-vnc .
