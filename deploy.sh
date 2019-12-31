#!/bin/bash

# This script publishes the master branch content to gh-pages branch

set -e

echo "Deleting old publication"
rm -rf public
mkdir -p public

git worktree prune
rm -rf .git/worktree/public/

# Requires the upstream repo to be set as "origin"
git worktree add -B gh-pages public origin/gh-pages

rm -rf public/*

echo "Generating site"
hugo

echo "Updating gh-pages branch"
cd public && git add --all && git commit -m "Publishing to gh-pages branch" && cd ..

git push --all
