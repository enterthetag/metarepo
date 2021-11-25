resource "github_repository" "repositories" {
  for_each = local.repositories

  name   = each.key
  topics = each.value.topics

  visibility   = each.value.visibility
  has_issues   = each.value.has_issues
  has_projects = each.value.has_projects
  has_wiki     = each.value.has_wiki

  auto_init            = each.value.auto_init
  gitignore_template   = each.value.gitignore_template
  vulnerability_alerts = each.value.vulnerability_alerts

  allow_merge_commit     = each.value.allow_merge_commit
  allow_squash_merge     = each.value.allow_squash_merge
  allow_rebase_merge     = each.value.allow_rebase_merge
  allow_auto_merge       = each.value.allow_auto_merge
  delete_branch_on_merge = each.value.delete_branch_on_merge
}

resource "github_team_repository" "team_repositories" {
  for_each = {
    for team in local.repository_teams :
    "${team.team_name}-${team.repository}" => team
  }

  team_id    = each.value.team_id
  repository = each.value.repository
  permission = each.value.permission
}

resource "github_branch_protection" "branch_protections" {
  for_each = {
    for pro in local.repository_protections :
    "${pro.repository}-${pro.pattern}" => pro
  }

  repository_id = each.value.repository_id
  pattern       = each.value.pattern

  require_signed_commits  = each.value.require_signed_commits
  required_linear_history = each.value.required_linear_history
  enforce_admins          = each.value.enforce_admins

  allows_force_pushes = each.value.allows_force_pushes
  allows_deletions    = each.value.allows_deletions

  required_pull_request_reviews {
    required_approving_review_count = each.value.required_pull_request_reviews.required_approving_review_count
    dismiss_stale_reviews           = each.value.required_pull_request_reviews.dismiss_stale_reviews
    require_code_owner_reviews      = each.value.required_pull_request_reviews.require_code_owner_reviews
  }

  required_status_checks {
    strict = each.value.required_status_checks.strict
  }
}
