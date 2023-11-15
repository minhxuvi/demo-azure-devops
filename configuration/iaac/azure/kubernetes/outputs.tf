# This file contains the Terraform outputs for the Azure Kubernetes Service (AKS) cluster.
# The outputs include sensitive information such as client key, client certificate, cluster CA certificate, cluster username, cluster password, kube config, and host.
# These outputs can be used by other Terraform modules or external tools to interact with the AKS cluster.
# FILEPATH: /Users/moc/Projects/demo-azure-devops/configuration/iaac/azure/kubernetes/outputs.tf
output "client_key" {
  value = azurerm_kubernetes_cluster.terraform-k8s.kube_config.0.client_key
  sensitive = true
}

output "client_certificate" {
  value = azurerm_kubernetes_cluster.terraform-k8s.kube_config.0.client_certificate
  sensitive = true
}

output "cluster_ca_certificate" {
  value = azurerm_kubernetes_cluster.terraform-k8s.kube_config.0.cluster_ca_certificate
  sensitive = true
}

output "cluster_username" {
  value = azurerm_kubernetes_cluster.terraform-k8s.kube_config.0.username
  sensitive = true
}

output "cluster_password" {
  value = azurerm_kubernetes_cluster.terraform-k8s.kube_config.0.password
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.terraform-k8s.kube_config_raw
  sensitive = true
}

output "host" {
  value = azurerm_kubernetes_cluster.terraform-k8s.kube_config.0.host
  sensitive = true
}
