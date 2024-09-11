variable "DIGITALOCEAN_TOKEN" {
  description = "The API token used for my DigitalOcean account."
  type = string
  sensitive = true
}

variable "SSH_KEY" {
  description = "The SSH key used to access the VM."
  type = string
  sensitive = false
}