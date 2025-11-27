FROM python:3.11-slim

RUN apt-get update && apt-get install -y wget bzip2 git curl && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-x86_64.sh -O /tmp/mambaforge.sh \
    && bash /tmp/mambaforge.sh -b -p /opt/conda \
    && rm /tmp/mambaforge.sh

ENV PATH=/opt/conda/bin:$PATH
RUN conda create -y -n dev python=3.11 && conda clean -afy
SHELL ["conda", "run", "-n", "dev", "/bin/bash", "-c"]