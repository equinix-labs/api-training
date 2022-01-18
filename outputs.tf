output "IP_Address" {
  value = metal_device.my_tf_server[*].access_public_ipv4
}

