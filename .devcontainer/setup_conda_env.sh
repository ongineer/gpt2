#!/bin/bash
set -e

ENV_PATH="/workspaces/.conda_envs/dev"
ENV_FILE="/workspaces/gpt2/environment.yml"

# Create or update environment from environment.yml
if [ ! -d "$ENV_PATH" ]; then
    echo "Creating Conda environment from environment.yml..."
    conda env create -p "$ENV_PATH" -f "$ENV_FILE"
else
    echo "Updating existing Conda environment from environment.yml..."
    conda env update -p "$ENV_PATH" -f "$ENV_FILE" --prune
fi

# Activate environment
echo "Activating environment..."
conda activate "$ENV_PATH"

# Optional: auto-activate in shell
SHELL_RC="$HOME/.bashrc"
if ! grep -q "$ENV_PATH" "$SHELL_RC"; then
    echo "conda activate $ENV_PATH" >> "$SHELL_RC"
fi

echo "Conda environment ready!"