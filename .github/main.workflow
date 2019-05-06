workflow "Build and Deploy" {
  on = "push"
  resolves = ["ballerina-platform/github-actions/cli/latest@master"]
}

action "ballerina-platform/github-actions/cli/latest@master" {
  uses = "ballerina-platform/github-actions/cli/latest@master"
  args = "push"
  secrets = ["AZURE_CV_KEY", "BALLERINA_CENTRAL_ACCESS_TOKEN"]
}
