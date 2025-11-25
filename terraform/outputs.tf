output "kubernetes_cluster_name" {
  value = module.gke.name
}

output "kubernetes_cluster_endpoint" {
  value = module.gke.endpoint
}

output "kubernetes_cluster_ca_certificate" {
  value     = module.gke.ca_certificate
  sensitive = true
}
