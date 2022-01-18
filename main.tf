provider "metal" {
  auth_token = var.api_key
}

resource "tls_private_key" "my_tf_ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "my_tf_priv_key" {
  content         = chomp(tls_private_key.my_tf_ssh_key.private_key_pem)
  filename        = "my_tf_ssh_key"
  file_permission = "0400"
}

resource "metal_ssh_key" "my_tf_ssh_key" {
  name       = "my_tf_ssh_key"
  public_key = chomp(tls_private_key.my_tf_ssh_key.public_key_openssh)
}

resource "metal_device" "my_tf_server" {
  depends_on       = [metal_ssh_key.my_tf_ssh_key]
  count            = 1
  hostname         = format("%s-%02d", var.name, count.index + 1)
  plan             = "c3.small.x86"
  metro            = "ny"
  operating_system = "ubuntu_21_04"
  billing_cycle    = "hourly"
  project_id       = var.project_id
}
