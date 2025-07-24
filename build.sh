#!/bin/bash
set -e

echo "🚀 Starting Flutter Web build for Vercel..."

# Install Flutter (latest stable version)
echo "📦 Installing Flutter..."
curl -fsSL https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.24.3-stable.tar.xz | tar -xJ

# Fix git ownership issues
echo "🔧 Fixing git permissions..."
git config --global --add safe.directory /vercel/path0/flutter || true

# Set PATH
export PATH="$PWD/flutter/bin:$PATH"

# Disable analytics and crash reporting for CI
echo "⚙️ Configuring Flutter for CI..."
flutter config --no-analytics --no-cli-animations

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
flutter build web --release --base-href /

# Ensure the build directory exists
if [ ! -d "build/web" ]; then
    echo "❌ Build directory not found!"
    exit 1
fi

echo "✅ Build completed successfully!"
echo "📁 Build output is in: build/web"
