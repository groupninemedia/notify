#!/bin/sh

set -e

# Setting Useful Environment Variables:
GIT_SHORT_SHA=$(echo $GITHUB_SHA | cut -c1-7)
GIT_BRANCH=$(echo $GITHUB_REF | cut -d'/' -f3)
PR_URL=$(cat /github/workflow/event.json | jq -r .pull_request.html_url)
REPO_URL=$(cat /github/workflow/event.json | jq -r .repository.html_url)

export GIT_SHORT_SHA=$GIT_SHORT_SHA
export GIT_BRANCH=$GIT_BRANCH
export REPO_URL=$REPO_URL
export PR_URL=$PR_URL



sh -c "$*"