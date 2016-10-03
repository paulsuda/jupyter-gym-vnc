
# Started with Dockerfile from https://github.com/openai/gym

FROM ubuntu:14.04

RUN apt-get update \
    && apt-get install -y \
        libav-tools \
        python-numpy \
        python-scipy \
        python-pyglet \
        python-setuptools \
        libpq-dev \
        libjpeg-dev \
        curl \
        cmake \
        swig \
        python-opengl \
        libboost-all-dev \
        libsdl2-dev \
        wget \
        unzip \
        git \
        xvfb \
        x11vnc \
        ratpoison \
        xterm \
    && apt-get --reinstall install xfonts-base \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && easy_install pip
    && rm -r /var/lib/apt/lists/* /root/.cache/pip/

# Jupyter Notebook
EXPOSE 8888
# TensorBoard
EXPOSE 6006
# Xvnc
EXPOSE 5900

# Install the OpenAI Gym
WORKDIR /opt
RUN git clone https://github.com/openai/gym.git && pip install -e './gym[all]'

COPY "container-startup.sh" "/opt/container-startup.sh"
RUN chmod +x "/opt/container-startup.sh"

WORKDIR /root

CMD ["/opt/container-startup.sh"]
