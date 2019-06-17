Boostrap:docker
From: nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04

#Install ubuntu packages
%post
apt-get update && apt-get install -y \
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
pip3 install --upgrade pip

# Install python libs
pip3 install ipython
pip3 install jupyter
pip3 install numpy==1.15.4
pip3 install scipy
pip3 install scikit-image
pip3 install scikit-learn
pip3 install dill
pip3 install progressbar2
pip3 install imageio
pip3 install opencv-python
pip3 install tqdm==4.11.2
pip3 install protobuf
pip3 install PyYAML
pip3 install pandas

# Install torch and torchvision
wget --no-check-certificate https://download.pytorch.org/whl/cu90/torch-0.4.0-cp35-cp35m-linux_x86_64.whl
pip3 install torch-0.4.0-cp35-cp35m-linux_x86_64.whl
pip3 install torchvision
pip3 install tensorboardX
pip3 install tifffile
pip3 install albumentations

