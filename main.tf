provider "github" {
  token = var.github_api_token
  owner = var.github_org
}

data "github_user" "self" {
  username = ""
}
