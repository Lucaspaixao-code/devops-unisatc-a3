output "kubernetes_cluster_name" {
  value = module.gke.name
  sensitive = false
}

output "kubernetes_cluster_endpoint" {
  value = module.gke.endpoint
  sensitive = false
}

output "kubernetes_cluster_ca_certificate" {
  value     = module.gke.ca_certificate
  sensitive = false
}
