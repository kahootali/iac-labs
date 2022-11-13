resource "github_repository" "my_repo" {
  name        = "repo-created-with-terraform"
  description = "My awesome repo created using terraform"
  auto_init   = true

  visibility = "public"
  topics     = ["terraform", "iac", "devops", "training"]

}

resource "github_branch_protection" "branch_protection" {
  repository_id = github_repository.my_repo.node_id
  # also accepts repository name
  # repository_id  = github_repository.example.name

  pattern          = "main"
  enforce_admins   = true
  allows_deletions = true

  required_status_checks {
    strict   = false
    contexts = ["ci/travis"]
  }

  required_pull_request_reviews {
    dismiss_stale_reviews           = true
    restrict_dismissals             = true
    required_approving_review_count = 3
  }

}

resource "github_branch" "development" {
  repository = "repo-created-with-terraform"
  branch     = "development"
}
