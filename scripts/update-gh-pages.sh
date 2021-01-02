#!/usr/bin/env bash

set -eu

remote_name="origin"
main_branch="master"
target_branch="gh-pages"
build_dir="dist"

echo "Configuring user.name && user.email"
git config user.name "$GITHUB_ACTOR"
git config user.email "{$GITHUB_ACTOR}@bots.github.com"

echo "Create folder"  
mkdir -p "${build_dir}"
echo "Fetch gh-pages into subtree"
git subtree split --prefix "${build_dir}" -b "${target_branch}"
echo "Build project in to dist"
yarn run build
echo "Add to staging dist/ "
git add -f dist
git commit -m "Update gh-pages"
echo "Push to gh-pages"
git push -f "${remote_name}" "${target_branch}":"${target_branch}"
echo "Cleaning up after deployment"
git branch -D "${target_branch}"
rm -rf "${build_dir}"