#!/bin/bash

# This script compiles SCSS to CSS using Hugo's extended features
# Run this before building the site

echo "Compiling SCSS to CSS..."

# Create a temporary Hugo site configuration for CSS compilation
cat > temp-config.toml << EOF
baseURL = "https://temp.example.com/"
title = "CSS Compilation"

[build]
writeStats = true

[module]
[[module.mounts]]
  source = "assets"
  target = "assets"
EOF

# Use Hugo to compile the SCSS
~/.local/bin/hugo --config temp-config.toml --renderToMemory --verbose

# Clean up
rm temp-config.toml

echo "CSS compilation complete!"