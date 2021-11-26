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

  secrets = [
    {
      secret_name     = "PYPI_TOKEN"
      visibility      = "all"
      plaintext_value = var.secret_pypi_token
    },
    {
      secret_name     = "SEMGREP_APP_TOKEN"
      visibility      = "all"
      plaintext_value = var.secret_semgrep_token
    }
  ]

  repositories = {
    for repo, config in var.repositories :
    repo => merge(local.default_repo_config, config)
  }

  repository_branches = flatten([
    for repo, config in local.repositories : [
      for branch in config.branches : {
        repository    = repo
        branch        = branch
        source_branch = config.default_branch
      }
    ]
  ])

  repository_default_branches = [
    for repo, config in local.repositories : {
      repository = repo
      branch     = config.default_branch
    }
  ]

  repository_protections = flatten([
    for repo, _ in local.repositories : [
      for pro in local.default_branch_pro : [
        merge(pro, {
          repository    = repo
          repository_id = github_repository.repositories[repo].id
        })
      ]
    ]
  ])

  repository_teams = flatten([
    for repo, config in local.repositories : [
      for team, permission in config.teams : {
        team_name  = team
        team_id    = github_team.teams[team].id
        repository = repo
        permission = permission
      }
    ]
  ])

  repository_issue_labels = flatten([
    for repo, config in local.repositories : [
      for label, colour in config.issue_labels : {
        repository = repo
        name       = label
        color      = colour
      }
    ]
  ])
}
