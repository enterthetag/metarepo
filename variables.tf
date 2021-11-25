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
      description = "Framework for building secure, privilege-separated UNIX daemons."

      gitignore_template = "Python"
      topics             = ["python", "framework", "services", "security", "privsep"]

      teams = {
        systems = "maintain"
        dev     = "push"
      }
    }

    anjana = {
      description = "Framework for service observability."

      gitignore_template = "Python"
      topics             = ["python", "framework", "logging", "metrics", "tracing"]

      teams = {
        systems = "maintain"
        dev     = "push"
      }
    }

    aleph = {
      description = "Framework for Pythonic microservices."

      gitignore_template = "Python"
      topics             = ["python", "framework", "microservices"]

      teams = {
        systems = "maintain"
        dev     = "maintain"
      }
    }
  }
}
