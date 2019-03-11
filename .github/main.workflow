workflow "Build and Deploy" {
  on = "push"
  resolves = ["lafernando/github-actions/cli/latest@master"]
}

action "lafernando/github-actions/cli/latest@master" {
  uses = "lafernando/github-actions/cli/latest@master"
  args = "push"
  secrets = ["BALLERINA_CENTRAL_ACCESS_TOKEN"]
}