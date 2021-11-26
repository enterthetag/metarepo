github_org = "enterthetag"

members = {}

teams = {
  systems = {
    description = "Systems Group"
    members     = {}
  },
  dev = {
    description = "Development Group"
    members     = {}
  }
}

allowed_actions = [
  "returntocorp/semgrep-action@v1",
  "hashicorp/setup-terraform@v1",
  "terraform-linters/setup-tflint@v1",
]

repositories = {
  # The Alef project.
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
  alef = {
    description = "Framework for Pythonic microservices."

    gitignore_template = "Python"
    topics             = ["python", "framework", "microservices"]

    teams = {
      systems = "maintain"
      dev     = "maintain"
    }
  }

  # The Lepus project.
  matricaria = {
    description = "Python implementation of sans-I/O AMQP, plus RabbitMQ extensions."

    gitignore_template = "Python"
    topics             = ["python", "protocol", "amqp", "rabbitmq", "sans-io"]

    teams = {
      systems = "maintain"
      dev     = "push"
    }
  }
  lepus = {
    description = "Trio-based async RabbitMQ Python client."

    gitignore_template = "Python"
    topics             = ["python", "protocol", "amqp", "rabbitmq", "async", "trio"]

    teams = {
      systems = "maintain"
      dev     = "push"
    }
  }
  hermes = {
    description = "High-level Python AMQP patterns."

    gitignore_template = "Python"
    topics             = ["python", "protocol", "amqp", "rabbitmq", "async", "trio", "patterns"]

    teams = {
      systems = "maintain"
      dev     = "push"
    }
  }

  # Miscellaneous bits.
  nominare = {
    description = "Trio-based Python DNS server."

    gitignore_template = "Python"
    topics             = ["python", "protocol", "dns", "server"]

    teams = {
      systems = "maintain"
      dev     = "push"
    }
  }
}
