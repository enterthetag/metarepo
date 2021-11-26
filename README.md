# metarepo
A repository to deal with repositories. Very meta.

## Springing stuff into life.

- Create a `secrets.tfvars` with a GitHub Personal Access Token and other secrets detailed in `variables.tf`:
  ```
  github_api_token = "ghp_lookaghtoken"
  ```
- Describe your desired GitHub setup in `org.auto.tfvars`.
- Run `terraform init`.
- Run `terraform apply -var-file="secrets.tfvars`.
