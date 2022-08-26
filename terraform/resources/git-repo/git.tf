resource "github_repository" "my_repo" {
  name        = "repo-created-with-terraform"
  description = "My awesome repo created using terraform"
  auto_init   = true

  visibility = "public"
  topics     = ["terraform", "iac", "devops", "training"]

}
