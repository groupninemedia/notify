# Notify Action
An action that allows you to send notification messages for:
- pull requests
- slack
---

## Extra Variables
The following variables are available to add more information to notifications:
```
GIT_SHORT_SHA: the first 7 characters of the commit SHA
GIT_BRANCH
PR_URL
REPO_URL
```

## Slack Example
```workflow
workflow "Notify Me" {
  on = "pull_request"
  resolves = ["Slack Notifier"]
}

action  "Slack Notifier" {
    uses = "groupninemedia/notify@master"
    args = "slack Testing Image https://image.registry/image:$GIT_SHORT_SHA for Branch $GIT_BRANCH on Pull Request $PR_URL for Repo $REPO_URL has Passed"
    secrets = ["SLACK_WEBHOOK"]
    env = {
        color = "#36a64f"
    }
}
```
- Anythng after inputing `slack` in the `args` field is used as the slack message.
- The color variable is **optional**
- The **SLACK_WEBHOOK** url should contain the channel you want to send the message to.
---

## PR Example
```workflow
workflow "Notify Me" {
  on = "pull_request"
  resolves = ["PR Notifier"]
}

action  "PR Notifier" {
    uses = "groupninemedia/notify@master"
    args = "pr Testing Image https://image.registry/image:$GIT_SHORT_SHA for Branch $GIT_BRANCH has Passed"
    secrets = ["GITHUB_TOKEN"]
}
```
- Anythng after inputing `pr` in the `args` field is used as the pr comment.