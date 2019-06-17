FROM nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04
MAINTAINER Michael Zelinski <zelinski1@llnl.gov>

# Set user specific env
ARG HOST_USERNAME=username
ARG HOST_UID=1001

# Create user with your username
RUN useradd --create-home --shell /bin/bash --groups sudo $HOST_USERNAME
RUN echo "${HOST_USERNAME}:password" | chpasswd

# Change id of username
RUN usermod -u $HOST_UID $HOST_USERNAME
RUN groupmod -g $HOST_UID $HOST_USERNAME

# Need to clear these sources for apt to work properly (necessary for nvidia/cuda base images)
RUN rm /etc/apt/sources.list.d/cuda.list && rm /etc/apt/sources.list.d/nvidia-ml.list

# Install LLNL cert
COPY opt/cspca.cer /usr/local/share/ca-certificates/cspca.cer
RUN update-ca-certificates

#https://ricardodeazambuja.com/deep_learning/2018/05/04/tuning_tensorflow_docker/
# Install ubuntu packages
RUN apt-get update && apt-get install -y \
    git \
    python3.5 \
    python3.5-dev \
    python3-pip \
    build-essential \
    cmake \
    wget \
    pkg-config \
    man-db \
    vim \
    eog \
    libopenblas-dev \
    liblapack-dev \
    gfortran \
    libsm6 \
    libxext6 \
    libxrender-dev \
    libgtk2.0-dev \
    libavcodec-dev \
    libavformat-dev \
    libswscale-dev

# Upgrade pip
RUN pip3 install --upgrade pip

# Install python libs
RUN pip3 install ipython
RUN pip3 install jupyter
RUN pip3 install numpy==1.15.4
RUN pip3 install scipy
RUN pip3 install scikit-image
RUN pip3 install scikit-learn
RUN pip3 install dill
RUN pip3 install progressbar2
RUN pip3 install imageio
RUN pip3 install opencv-python
RUN pip3 install tqdm==4.11.2
RUN pip3 install protobuf
RUN pip3 install PyYAML
RUN pip3 install pandas

# Install torch and torchvision
WORKDIR /opt

RUN wget --no-check-certificate https://download.pytorch.org/whl/cu90/torch-0.4.0-cp35-cp35m-linux_x86_64.whl
RUN pip3 install torch-0.4.0-cp35-cp35m-linux_x86_64.whl
RUN pip3 install torchvision
RUN pip3 install tensorboardX
RUN pip3 install tifffile
RUN pip3 install albumentations

