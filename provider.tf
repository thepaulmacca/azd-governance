terraform {
  backend "azurerm" {}

  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = ">=3.1.0"
    }
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">=1.7.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=4.20.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1.0"
    }
  }

  required_version = ">= 0.15"
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
  subscription_id = "0955555d-1440-4dc9-a218-5c056ac178cb"
}

provider "azuredevops" {}
