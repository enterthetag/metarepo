locals {
  teams = {
    for team, config in var.teams :
    team => merge(local.default_team_config, config)
  }

  team_members = flatten([
    for team, config in var.teams : [
      for member, role in config.members : {
        name     = "${team}-${member}"
        team_id  = github_team.teams[team].id
        username = member
        role     = role
      }
    ]
  ])

  repositories = {
    for repo, config in var.repositories :
    repo => merge(local.default_repo_config, config)
  }

  repository_protections = flatten([
    for repo, _ in var.repositories : [
      for pro in local.default_branch_pro : [
        merge(pro, {
          repository    = repo
          repository_id = github_repository.repositories[repo].id
        })
      ]
    ]
  ])

  repository_teams = flatten([
    for repo, config in var.repositories : [
      for team, permission in config.teams : {
        team_name  = team
        team_id    = github_team.teams[team].id
        repository = repo
        permission = permission
      }
    ]
  ])
}
