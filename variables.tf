variable "github_api_token" {
  description = "GitHub Personal Access Token"
  type        = string
  sensitive   = true
}

variable "github_org" {
  description = "GitHub organisation"
  type        = string
}

variable "secret_pypi_token" {
  description = "PyPI token"
  type        = string
  sensitive   = true
}

variable "secret_semgrep_token" {
  description = "Semgrep token"
  type        = string
  sensitive   = true
}

variable "members" {
  description = "Organisation members"
  type        = map(string)

  validation {
    condition = alltrue([
      for role in var.members :
      contains(["member", "admin"], role)
    ])
    error_message = "All organisation members must be either 'member' or 'admin'."
  }
}

variable "teams" {
  description = "Organisation team list"
  type = map(object({
    description = string
    members     = map(string)
  }))

  validation {
    condition = alltrue(flatten([
      for team in var.teams : [
        for role in team.members :
        contains(["member", "maintainer"], role)
      ]
    ]))
    error_message = "All team members must be either 'member' or 'maintainer'."
  }
}

variable "allowed_actions" {
  description = "GitHub Actions allowed organisation-wide"
  type        = list(string)
}

variable "repositories" {
  description = "Organisation repositories"

  validation {
    condition = alltrue(flatten([
      for repo in var.repositories : [
        for perm in repo.teams :
        contains(["pull", "triage", "push", "maintain", "admin"], perm)
      ]
    ]))
    error_message = "All repository teams must have one of: pull, triage, push, maintain, or admin."
  }
}
