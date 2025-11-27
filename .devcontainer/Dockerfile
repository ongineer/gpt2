# Start from your base image
FROM python:3.11-slim

# Install dependencies for apt + gh
RUN apt-get update && \
    apt-get install -y curl git sudo && \
    rm -rf /var/lib/apt/lists/*

# Install GitHub CLI
RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
    && chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" \
       | tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && apt update \
    && apt install -y gh

# Optional: Install Conda/Mamba (for ML/LLM projects)
RUN apt-get install -y wget bzip2 && \
    wget https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-x86_64.sh -O /tmp/mambaforge.sh \
    && bash /tmp/mambaforge.sh -b -p /opt/conda \
    && rm /tmp/mambaforge.sh

ENV PATH=/opt/conda/bin:$PATH
RUN conda create -y -n dev python=3.11 && conda clean -afy
SHELL ["conda", "run", "-n", "dev", "/bin/bash", "-c"]