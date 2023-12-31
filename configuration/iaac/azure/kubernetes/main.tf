# This resource block creates an Azure resource group.
resource "azurerm_resource_group" "resource_group" {
  name     = "${var.resource_group}_${var.environment}"
  location = var.location
}

# This block configures the Azure provider.
provider "azurerm" {
  #version = "~>2.0.0"
  features {}
}

# This resource block creates an Azure Kubernetes Service (AKS) cluster.
resource "azurerm_kubernetes_cluster" "terraform-k8s" {
  name                = "${var.cluster_name}_${var.environment}"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  dns_prefix          = var.dns_prefix

  # This block configures the Linux profile for the AKS cluster.
  linux_profile {
    admin_username = "ubuntu"

    ssh_key {
      key_data = file(var.ssh_public_key)
    }
  }

  # This block configures the default node pool for the AKS cluster.
  default_node_pool {
    name            = "agentpool"
    node_count      = var.node_count
    vm_size         = "standard_b2ms"
    # vm_size         = "Standard_B1ms"
    # vm_size         = "standard_d2as_v5"      CHANGE IF AN ERROR ARISES 
  }

  # This block configures the service principal for the AKS cluster.
  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }

  # This block adds tags to the AKS cluster.
  tags = {
    Environment = var.environment
  }
}

# This block configures the backend for Terraform.
terraform {
  backend "azurerm" {
    # storage_account_name="<<storage_account_name>>" #OVERRIDE in TERRAFORM init
    # access_key="<<storage_account_key>>" #OVERRIDE in TERRAFORM init
    # key="<<env_name.k8s.tfstate>>" #OVERRIDE in TERRAFORM init
    # container_name="<<storage_account_container_name>>" #OVERRIDE in TERRAFORM init
  }
}
