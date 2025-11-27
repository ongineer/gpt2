# Base image
FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive
ARG WORKSPACE_FOLDER
ENV HOME=/home/opoudel
ENV PATH=/opt/conda/bin:$PATH

# Create user
RUN useradd -m -s /bin/bash -d /home/opoudel opoudel

# Install dependencies + GitHub CLI
RUN apt-get update && apt-get install -y \
    curl wget git git-lfs sudo bzip2 build-essential ca-certificates \
    && curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg \
       | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
    && chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" \
       | tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && apt-get update && apt-get install -y gh \
    && rm -rf /var/lib/apt/lists/*

# Install Miniforge
RUN curl -fsSL https://github.com/conda-forge/miniforge/releases/download/25.9.1-0/Miniforge3-25.9.1-0-Linux-x86_64.sh \
    -o /tmp/mambaforge.sh \
    && bash /tmp/mambaforge.sh -b -p /opt/conda \
    && rm /tmp/mambaforge.sh

# Switch to opoudel
USER opoudel
WORKDIR /home/opoudel

# Configure Git LFS for opoudel
RUN git lfs install