# metarepo
A repository to deal with repositories. Very meta.

## Springing stuff into life.

- Create a `github.tfvars` with a GitHub Personal Access Token:
  ```
  github_api_token = "ghp_lookaghtoken"
  ```
- Run `terraform init`.
- Run `terraform apply -var-file="github.tfvars`.
