#!/bin/bash

# andalask8s Build Script
# Purpose: Build a custom Debian ISO with Kubernetes

set -e

echo "Starting andalask8s build process..."

# Check for root
if [ "$EUID" -ne 0 ]; then 
  echo "Please run as root (sudo)"
  exit 1
fi

# Clean previous builds
lb clean --all

# Build the ISO
# This can take 20-40 minutes depending on internet speed and CPU
lb build

echo "Build complete! Your ISO is ready."
ls -lh *.iso
