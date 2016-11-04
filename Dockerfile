
# Started with the Tensorflow image
FROM b.gcr.io/tensorflow/tensorflow

# Install open ai gym requirements and X11 stuff
RUN apt-get update \
    && apt-get install -y \
        libav-tools \
        python-pyglet \
        python-opengl \
        libpq-dev \
        libjpeg-dev \
        libboost-all-dev \
        libsdl2-dev \
        curl \
        cmake \
        swig \
        wget \
        unzip \
        git \
        xvfb \
        x11vnc \
        ratpoison \
        xterm \
        python-tk \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /root/.cache/pip/

# Jupyter Notebook
EXPOSE 8888

# TensorBoard
EXPOSE 6006

# Xvnc
EXPOSE 5900

# Install the OpenAI Gym
WORKDIR /opt
RUN git clone https://github.com/openai/gym.git && pip install -e './gym[all]'

COPY "container-start.sh" "/opt/container-start.sh"
COPY "xsession-start.sh" "/opt/xsession-start.sh"
RUN chmod +x "/opt/container-start.sh" "/opt/xsession-start.sh"

WORKDIR /root

CMD ["/opt/container-start.sh"]
