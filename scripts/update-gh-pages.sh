#!/usr/bin/env bash

set -eu

repo_uri="https://x-access-token:${DEPLOY_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"
remote_name="origin"
main_branch="master"
target_branch="gh-pages"
build_dir="dist"

echo "Configuring user.name && user.email"
git config user.name "$GITHUB_ACTOR"
git config user.email "{$GITHUB_ACTOR}@bots.github.com"

echo "Create folder"  
mkdir -p "${build_dir}"
git subtree split --prefix "${build_dir}" -b "${target_branch}"
yarn run build
git push -f origin "${target_branch}":"${target_branch}"
git branch -D "${target_branch}"
rm -rf "${build_dir}"