workflow "Build and Deploy" {
  on = "push"
  resolves = ["lafernando/github-actions/cli/latest@master"]
}

action "ballerina-platform/github-actions/cli/latest@master" {
  uses = "ballerina-platform/github-actions/cli/latest@master"
  args = "push"
  secrets = [
    "BALLERINA_CENTRAL_ACCESS_TOKEN",
    "AZURE_CV_KEY",
    "GITHUB_TOKEN",
  ]
}
