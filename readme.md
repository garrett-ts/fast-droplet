# Fast Droplet

For spinning up an Ubuntu VM in Digital Ocean really fast!

## Steps

### 1. Clone the repo

``` shell
git clone https://github.com/garrett-ts/fast-droplet.git

cd fast-droplet
```

### 2. Install Terraform

You can do so on MacOS with homebrew:

``` shell
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```

### 2. Generate and set your Digital Ocean token

This will be required for Terraform to create the VM via the Digital Ocean API.
[How to create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/)

Copy your token, and set it as an environment variable.

``` shell
export TF_VAR_DIGITALOCEAN_TOKEN='paste_token_here'
```

### 3. Generate and set an SSH key to access the VM

This is required in order to access the VM. This step only needs to be done once.
[How to create SSH keys](https://www.digitalocean.com/community/tutorials/how-to-create-ssh-keys-with-openssh-on-macos-or-linux)

Once the key is generated, make note of its location and use the appropriate curl command.

If you have a new SSH key that hasn't been added to your account:

``` shell
curl -X POST \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $TF_VAR_DIGITALOCEAN_TOKEN" \
  -d '{"name":"your_name_here","public_key":"paste the public key's contents here"}' \
  "https://api.digitalocean.com/v2/account/keys" 
  ```

If you have an existing SSH key and need the ID:

``` shell
curl -X GET \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $TF_VAR_DIGITALOCEAN_TOKEN" \
  "https://api.digitalocean.com/v2/account/keys" | jq '.'
```

In either command, make note of the ID in the curl output. It must be set as an environment variable.

``` shell
export TF_VAR_SSH_KEY='paste_key_id_here'
```

### 4. Invoke Terraform

``` shell
terraform init

terraform plan

terraform apply
```

Confirm the terraform commands with `yes`.

If successful, the output of the `terraform apply` command will include the public IP of the VM. Use that with your provided SSH key to access it.

``` shell
ssh -i 'path/to/ssh_key' root@vm_ip_address
```
