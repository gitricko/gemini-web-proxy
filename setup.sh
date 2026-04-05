#!/bin/bash

echo "Setting up Gemini Web Proxy for OpenCode..."
echo "=========================================="

# Check Python version
python_version=$(python --version 2>&1 | grep -oE '[0-9]+\.[0-9]+')

# Split into major and minor
IFS='.' read -r major minor <<< "$python_version"

if (( major < 3 || (major == 3 && minor < 8) )); then
    echo "Error: Python 3.8 or higher is required"
    exit 1
fi

echo "✓ Python version check passed"

# Create and activate virtual environment
python -m venv .venv
source .venv/bin/activate

echo "✓ Virtual environment created and activated"

# Install Python dependencies
echo "Installing Python dependencies..."
pip install -r requirements.txt

# Install Playwright browsers
echo "Installing Playwright browsers..."
playwright install chromium

echo ""
echo "Setup complete!"
echo ""
echo "Next steps:"
echo "1. Run: python run.py"
echo "2. Log in to your Google account when browser opens"
echo "3. Configure OpenCode with the provider settings from README.md"
echo ""
echo "For detailed instructions, see README.md"
