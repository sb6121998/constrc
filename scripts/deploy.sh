#!/usr/bin/env bash
set -e

echo "🚀 Building production bundle..."
npm run build
touch dist/.nojekyll

echo "📦 Deploying to GitHub Pages (gh-pages branch)..."
git -C dist init -b gh-pages
git -C dist add -A
git -C dist commit -m "Deploy site to GitHub Pages: $(date '+%Y-%m-%d %H:%M:%S')" || true
git -C dist push -f https://github.com/sb6121998/constrc.git gh-pages

echo "✅ Successfully deployed to https://sb6121998.github.io/constrc/"
