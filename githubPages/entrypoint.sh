#!/bin/bash

set -e

# Environment variables

# Specifies the type of repository
# Valid values:
# - `project`
# - `user`
# Default: `project`
# DEPRECATED: Please use GH_PAGES_BRANCH instead which allows for more configuration.
if [[ -n "$GH_PAGES_TYPE" ]]; then
  echo -e "DEPRECATED: Please use the GH_PAGES_BRANCH environment variable instead of GH_PAGES_TYPE.\nThis may be removed in a future release."
  if [[ "$GH_PAGES_TYPE" = "project" ]]; then
    GH_PAGES_BRANCH="gh-pages"
  elif [[ "$GH_PAGES_TYPE" = "user" ]]; then
    GH_PAGES_BRANCH="master"
  fi
fi
# Specifies the branch to deploy to
# Default: `gh-pages`
GH_PAGES_BRANCH=${GH_PAGES_BRANCH:-"gh-pages"}
# Specifies the folder that Jekyll builds to
# Default: `_site`
GH_PAGES_DIST_FOLDER=${GH_PAGES_DIST_FOLDER:-"_site"}
# Specifies the commit message
GH_PAGES_MESSAGE=${GH_PAGES_MESSAGE:-"Deploy commit $GITHUB_SHA\nAutodeployed using $GITHUB_ACTION in $GITHUB_WORKFLOW"}
# Specifies the Git remote repository
REMOTE_REPO=${REMOTE_REPO:-"https://${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"}
# Specifies the committer's username
# Default: $GITHUB_ACTOR
COMMITTER_USERNAME=${COMMITTER_USERNAME:-$GITHUB_ACTOR}
# Specifies the committer's email
# Default: `${GITHUB_ACTOR}@users.noreply.github.com`
COMMITTER_EMAIL=${COMMITTER_EMAIL:-"${GITHUB_ACTOR}@users.noreply.github.com"}


echo "Installing gem bundle..."
# Prevent installed dependencies messages from clogging the log
bundle install > /dev/null 2>&1

# Check if jekyll is installed
bundle list | grep "jekyll ("

echo "Successfully installed gem bundles! Building..."
bundle exec jekyll build
echo "Successfully built the site!"

echo "Pushing to GitHub Pages..."

if [[ -d "$GH_PAGES_DIST_FOLDER" ]]; then
  rm -rf "$GH_PAGES_DIST_FOLDER"
  mkdir "$GH_PAGES_DIST_FOLDER"
else
  echo "The dist folder doesn't exist! Either you did not set GH_PAGES_DIST_FOLDER properly, or you changed the destination in the Jekyll configuration!"
  exit 1
fi

echo "Cloning repository locally..."
git clone "$REMOTE_REPO" --branch "$GH_PAGES_BRANCH" "$GH_PAGES_DIST_FOLDER"
if [[ -d "$GH_PAGES_DIST_FOLDER" ]]; then
  cd "$GH_PAGES_DIST_FOLDER"
else
  echo "An error occurred while changing the working directory. See the log above for more info."
  exit 1
fi

echo "Setting Git username and email..."
git config user.name "$COMMITTER_USERNAME"
git config user.email "$COMMITTER_EMAIL"

echo "Committing all files..."
git add -A
# echo -n "Files to commit: " && ls -l | wc -l


git commit -m $"$GH_PAGES_MESSAGE"
git push --force origin $GH_PAGES_BRANCH

cd ..

echo "Success!"
