resource "github_membership" "members" {
  for_each = var.members

  username = each.key
  role     = each.value
}
