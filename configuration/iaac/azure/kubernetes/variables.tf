# Define variables for Azure AD application credentials and SSH public key
variable client_id {}
variable client_secret {}
variable ssh_public_key {}

# Define variables for environment, location, node count, DNS prefix, cluster name, and resource group
variable environment {
  default = "dev"
}

variable location {
  default = "southeastasia"
}

variable node_count {
  default = 2
}

variable dns_prefix {
  default = "k8stest"
}

variable cluster_name {
  default = "k8stest"
}

variable resource_group {
  default = "kubernetes"
}