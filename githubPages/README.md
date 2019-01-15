# Deploy to GitHub Pages

A GitHub Action that builds and deploys a Jekyll site to GitHub Pages.

## Environment variables

Name | Description | Default | Allowed values
---|---|---|---
`GH_PAGES_BRANCH` | Specifies the branch to deploy to | `gh-pages` | Any branch name
`GH_PAGES_DIST_FOLDER` | Specifies the folder that Jekyll builds to | `_site` | A folder name
`GH_PAGES_MESSAGE` | Specifies the commit message | `Deploy commit $GITHUB_SHA\nAutodeployed using $GITHUB_ACTION in $GITHUB_WORKFLOW` | A commit message
`REMOTE_REPO` | Specifies the Git remote repository | `https://${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git` | A remote repo
`COMMITTER_USERNAME` | Specifies the committer's username | `$GITHUB_ACTOR` | A GitHub username
`COMMITTER_EMAIL` | Specifies the committer's email | `${GITHUB_ACTOR}@users.noreply.github.com` | A valid email address

## Secrets used

This script does not use any secrets.

## Arguments

This script does not take in any arguments.
