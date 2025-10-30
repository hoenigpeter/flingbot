FROM nvidia/cudagl:9.2-devel-ubuntu18.04

# Dependencies for glvnd, X11, and other build tools
RUN apt-get update \
  && apt-get install -y -qq --no-install-recommends \
     libglvnd0 libgl1 libglx0 libegl1 libxext6 libx11-6 \
     cmake build-essential libgl1-mesa-dev freeglut3-dev libglfw3-dev libgles2-mesa-dev \
     openexr wget bzip2 ca-certificates curl \
     libopenexr-dev \
  && rm -rf /var/lib/apt/lists/*

ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES graphics,utility,compute

WORKDIR /workspace

# Install Miniconda3
ENV CONDA_DIR=/opt/conda
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda.sh \
  && /bin/bash /tmp/miniconda.sh -b -p $CONDA_DIR \
  && rm /tmp/miniconda.sh

ENV PATH=$CONDA_DIR/bin:$PATH

# Update conda and install mamba from conda-forge
RUN conda update -n base -c defaults conda -y \
 && conda install -n base -c conda-forge mamba -y

# Make mamba default by aliasing conda to mamba in bashrc
RUN echo "alias conda='mamba'" >> $CONDA_DIR/etc/profile.d/conda.sh

# Enable conda in bash
RUN echo ". $CONDA_DIR/etc/profile.d/conda.sh" >> /etc/bash.bashrc

CMD ["/bin/bash"]
