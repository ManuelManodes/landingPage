#!/bin/bash
set -e

echo "🚀 Starting Flutter Web build for Vercel..."

# Install Flutter
echo "📦 Installing Flutter..."
curl -fsSL https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.24.3-stable.tar.xz | tar -xJ
export PATH="$PWD/flutter/bin:$PATH"

# Verify Flutter installation
echo "✅ Verifying Flutter installation..."
flutter --version

# Enable web support
echo "🌐 Enabling web support..."
flutter config --enable-web

# Get dependencies
echo "📦 Getting dependencies..."
flutter pub get

# Build for web
echo "🔨 Building for web..."
flutter build web --release --web-renderer html

echo "✅ Build completed successfully!"
