terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {

    # Env variable do_token must be set before using terraform plan or terraform apply. 
    # It must be prepended with TF_VAR_ in order for terraform to recognize it
    # export TF_VAR_DIGITALOCEAN_TOKEN='$key'

  token = var.DIGITALOCEAN_TOKEN
}

resource "digitalocean_droplet" "quick_droplet" {
  image = "ubuntu-24-04-x64" # Ubuntu 24.04 LTS x64
  name = "tf-quick-vm"
  region = "nyc1"
  size = "s-1vcpu-512mb-10gb" # Basic 512GB CPU 10GB STORAGE
  ssh_keys = [ 
    var.SSH_KEY
   ]
   tags = [ 
    "terraform",
    "testing"
    ]
}