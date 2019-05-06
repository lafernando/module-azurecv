workflow "Build and Deploy" {
  on = "push"
  resolves = ["Ballerina Push"]
}

action "Ballerina Push" {
  uses = "ballerina-platform/github-actions/cli/latest@master"
  args = "push"
  secrets = ["AZURE_CV_KEY", "BALLERINA_CENTRAL_ACCESS_TOKEN"]
}
