resource "github_actions_organization_permissions" "org_action_permissions" {
  enabled_repositories = "all"

  allowed_actions = "selected"
  allowed_actions_config {
    github_owned_allowed = true
    verified_allowed     = true
    patterns_allowed     = var.allowed_actions
  }
}
