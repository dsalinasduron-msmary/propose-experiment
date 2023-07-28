FROM ubuntu:18.04

ENV PATH=$PATH:/miniconda/bin
ENV PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig
ENV MYSQLCLIENT_CFLAGS="pkg-config mysqlclient --cflags"
ENV MYSQLCLIENT_LDFLAGS="pkg-config mysqlclient --libs"


RUN apt update
RUN apt install -y wget
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-py38_23.5.2-0-Linux-x86_64.sh
RUN bash ./Miniconda3-py38_23.5.2-0-Linux-x86_64.sh -b -p ./miniconda

RUN conda init
RUN conda install -c conda-forge pygpu
RUN conda install -c conda-forge sos
RUN conda install -c conda-forge mpi4py
RUN conda install -c conda-forge pycuda
RUN conda install -c conda-forge pygobject
RUN conda install -c conda-forge pywavelets
RUN conda install -c conda-forge mysqlclient
RUN conda install -c conda-forge dbus-python

SHELL ["bash", "-c"]

RUN apt update
RUN apt install -y apt-utils
RUN apt install -y libsystemd-dev
RUN apt install -y caffe-cuda
RUN apt install -y command-not-found
RUN apt install -y python3-dask
RUN apt install -y distro-info
RUN apt install -y icdiff
RUN apt install -y iotop
RUN apt install -y default-libmysqlclient-dev
RUN apt install -y build-essential
RUN apt install -y pkg-config
RUN apt install -y libcairo2-dev
RUN apt install -y python-apt
RUN apt install -y ubuntu-advantage-tools
RUN apt install -y ufw
RUN apt install -y unattended-upgrades



RUN pip install wheel
RUN pip install setuptools==58

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
