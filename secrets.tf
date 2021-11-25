resource "github_actions_organization_secret" "org_secrets" {
  for_each = {
    for secret in local.secrets :
    "${var.github_org}-${secret.secret_name}" => secret
  }

  secret_name     = each.value.secret_name
  visibility      = each.value.visibility
  plaintext_value = each.value.plaintext_value
}
