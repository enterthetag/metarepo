locals {
  default_team_config = {
    privacy                   = "closed"
    create_default_maintainer = true
  }

  default_repo_config = {
    visibility   = "private",
    has_issues   = true
    has_projects = true
    has_wiki     = false

    auto_init            = true
    vulnerability_alerts = true

    allow_merge_commit     = true
    allow_squash_merge     = false
    allow_rebase_merge     = true
    allow_auto_merge       = false
    delete_branch_on_merge = true
  }

  default_branch_pro = [
    {
      pattern = "master"

      require_signed_commits  = false
      required_linear_history = false
      enforce_admins          = true

      allows_force_pushes = false
      allows_deletions    = false

      required_pull_request_reviews = {
        required_approving_review_count = 1
        dismiss_stale_reviews           = true
        require_code_owner_reviews      = true
      }

      required_status_checks = {
        strict = true
      }
    }
  ]
}
