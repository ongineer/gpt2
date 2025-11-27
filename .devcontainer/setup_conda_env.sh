#!/bin/bash
set -e

# Use workspace folder dynamically
ENV_PATH="${WORKSPACE_FOLDER}/.conda_envs/dev"
ENV_FILE="${WORKSPACE_FOLDER}/environment.yml"

# Source conda functions
source /opt/conda/etc/profile.d/conda.sh

# Create or update environment
if [ ! -d "$ENV_PATH" ]; then
    echo "Creating Conda environment from environment.yml..."
    conda env create -p "$ENV_PATH" -f "$ENV_FILE"
else
    echo "Updating existing Conda environment from environment.yml..."
    conda env update -p "$ENV_PATH" -f "$ENV_FILE" --prune
fi

# Optional: auto-activate in interactive shells
SHELL_RC="$HOME/.bashrc"
if ! grep -q "$ENV_PATH" "$SHELL_RC"; then
    echo "conda activate $ENV_PATH" >> "$SHELL_RC"
fi

echo "Conda environment ready!"