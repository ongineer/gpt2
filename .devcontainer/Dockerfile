# Base image
FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies for Conda + GH CLI + ML libs
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    sudo \
    bzip2 \
    build-essential \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Install GitHub CLI
RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg \
    | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
    && chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" \
       | tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && apt-get update && apt-get install -y gh

# Install Miniforge / Mambaforge
RUN curl -fsSL https://github.com/conda-forge/miniforge/releases/download/25.9.1-0/Miniforge3-25.9.1-0-Linux-x86_64.sh \
    -o /tmp/mambaforge.sh \
    && bash /tmp/mambaforge.sh -b -p /opt/conda \
    && rm /tmp/mambaforge.sh

# Copy the setup script into the image
COPY .devcontainer/setup_conda_env.sh /tmp/setup_conda_env.sh

# Make it executable
RUN chmod +x /tmp/setup_conda_env.sh

ENV PATH=/opt/conda/bin:$PATH
