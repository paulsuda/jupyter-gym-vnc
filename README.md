
This Docker image tries to make it as easy as possible to run the
OpenAI Gym environments in Jupyter notebooks from within a self
contained package.

 * Provides a VNC server on port 5900 (password is "1234", configurable via env variable)
 * Provides a Jupyter notebook server on port 8888
 * Serves Jupyter notebooks from a volume mounted to /mnt/notebooks
 * OpenAI Gym and lots of other Python libraries related to machine learning are already installed

## Get Started:

Run the Open AI Gym and Jupyter right now with this one weird command line...

  `docker run -ti -p 18888:8888 -p 15900:5900 --volume=$HOME/notebooks:/mnt/notebooks psuda/jupyter-gym-vnc`

... this maps the container port 8888 to your host system port 18888, 5900 to 15900, etc. This is to avoid conflict with services that may be running on the host system. Omit or change the --volume option depending on if you handle notebooks in a folder on the host machine.

 1. Connect to Jupyter in your browser: [http://localhost:18888](http://localhost:18888)
 2. Connect to the VNC server with your favorite VNC client to port 15900 at localhost
 3. Run some environments. Open a notebook and run the CartPole-v0 example from [https://gym.openai.com/docs](https://gym.openai.com/docs) . It will display a graphic in the VNC session while you interact with it in Jupyter.

## Details:

This builds on top of the b.gcr.io/tensorflow/tensorflow image to add the OpenAI
gym package, dependencies of OpenAI Gym, and a headless X11 environment. The X
server is rendered via x11vnc so that the graphical part of OpenAI Gym
can be viewed on any platform without X11 readily available.

This builds a Python 2 environment.

### For OSX Users:
 * You should probably map VNC to a port that's not 5900, OSX runs service on that port by default.
 * Safari handles special VNC URLs, like [vnc://localhost:15900](vnc://localhost:15900), with the OSX built in "Screen Sharing" app.

### How to Build:
  `docker build -t psuda/jupyter-gym-vnc . `
