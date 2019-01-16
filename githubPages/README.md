# Deploy to GitHub Pages

A GitHub Action that builds and deploys a Jekyll site to GitHub Pages.


## Environment variables

Name | Description | Default | Allowed values
---|---|---|---
`GH_PAGES_BRANCH` | Specifies the branch to deploy to | `gh-pages` | Any branch name
`GH_PAGES_DIST_FOLDER` | Specifies the folder that Jekyll builds to | `_site` | A folder name
`GH_PAGES_COMMIT_MESSAGE` | Specifies the commit message | `Deploy commit $GITHUB_SHA\nAutodeployed using $GITHUB_ACTION in $GITHUB_WORKFLOW` | A commit message
`REMOTE_REPO` | Specifies the Git remote repository | `https://${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git` | A remote repo
`COMMITTER_USERNAME` | Specifies the committer's username | `$GITHUB_ACTOR` | A GitHub username
`COMMITTER_EMAIL` | Specifies the committer's email | `${GITHUB_ACTOR}@users.noreply.github.com` | A valid email address
`GIT_FORCE` | Whether to add the `--force` flag to `git push`. | `true` | A boolean (`true` or `false`), or an integer (`0` or `1`)
`OVERRIDE_GH_PAGES_BRANCH` | Whether to override the contents of the existing branch with the contents of the build. (Should be used with `GIT_FORCE` set to `false`) | `false` | A boolean (`true` or `false`), or an integer (`0` or `1`)

## Secrets used

This script does not use any secrets.

## Arguments

This script does not take in any arguments.

## Examples

Add the following code to define an action:

```hcl
workflow "Deploy Site" {
  on = "push"
  resolves = ["Build and Deploy Jekyll"]
}

action "Build and Deploy Jekyll" {
  uses = "Chan4077/actions/githubPages@master"
  secrets = ["GITHUB_TOKEN"]
}
```
