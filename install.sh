#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "🚀 Starting Ubuntu dotfiles installation..."

# 1. Install Stow if it's not installed
if ! command -v stow &> /dev/null; then
    echo "📦 GNU Stow not found. Installing via apt..."
    sudo apt update
    sudo apt install -y stow
else
    echo "✅ GNU Stow is already installed."
fi

# 2. Ensure ~/.config exists so Stow doesn't link folders incorrectly
mkdir -p "$HOME/.config"

# 3. Change to the dotfiles directory (where this script lives)
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$DOTFILES_DIR"

echo "🔗 Symlinking configuration files..."

# 4. Loop through all directories inside dotfiles and stow them
for folder in */; do
    # Strip the trailing slash for clean printing
    folder_name="${folder%/}"
    
    echo "   -> Stowing: $folder_name"
    stow --target="$HOME" "$folder_name"
done

echo "🎉 All done! Your dotfiles are linked and ready."
