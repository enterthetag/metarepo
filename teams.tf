resource "github_team" "teams" {
  for_each = local.teams

  name                      = each.key
  description               = each.value.description
  privacy                   = each.value.privacy
  create_default_maintainer = each.value.create_default_maintainer
}

resource "github_team_membership" "team_members" {
  for_each = {
    for member in local.team_members :
    member.name => member
  }

  team_id  = each.value.team_id
  username = each.value.username
  role     = each.value.role
}
