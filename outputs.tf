# IPv4 address of the droplet
output "droplet_ip_addr" {
  value = digitalocean_droplet.quick_droplet.ipv4_address
  description = "The public IPv4 address of the droplet."
}

# Status of the droplet
output "droplet_status" {
  value = digitalocean_droplet.quick_droplet.status
  description = "The status of the droplet."
}