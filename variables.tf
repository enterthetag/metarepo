variable "github_api_token" {
  description = "GitHub Personal Access Token"
  type        = string
  sensitive   = true
}

variable "github_org" {
  description = "GitHub organisation"
  type        = string

  default = "enterthetag"
}

variable "members" {
  description = "Organisation members"

  default = {
    # member  = "role"
  }
}

variable "teams" {
  description = "Organisation team list"

  default = {
    systems = {
      description = "Systems Group"
      members = {
        # member  = "role"
      }
    },
    dev = {
      description = "Development Group"
      members = {
        # member  = "role"
      }
    }
  }
}

variable "repositories" {
  description = "Organisation repositories"

  default = {
    milton = {
      gitignore_template = "Python"
      topics             = ["python", "framework", "services", "security", "privsep"]

      teams = {
        systems = "maintain"
        dev     = "push"
      }
    }

    anjana = {
      gitignore_template = "Python"
      topics             = ["python", "framework", "logging", "metrics", "tracing"]

      teams = {
        systems = "maintain"
        dev     = "push"
      }
    }

    aleph = {
      gitignore_template = "Python"
      topics             = ["python", "framework", "microservices"]

      teams = {
        systems = "maintain"
        dev     = "maintain"
      }
    }
  }
}
