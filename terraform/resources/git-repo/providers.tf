terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.29.0"
    }
  }
}

# Configure the GitHub Provider

provider "github" {
  token = var.token
  owner = var.owner
}

variable "token" {
  type = string
}

variable "owner" {
  type    = string
  default = "kahootali"
}
