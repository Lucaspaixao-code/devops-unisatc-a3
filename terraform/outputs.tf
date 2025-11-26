output "kubernetes_cluster_name" {
  value = module.gke.name
}

output "kubernetes_cluster_location" {
  value = module.gke.location
}

output "kubernetes_cluster_endpoint" {
  value     = module.gke.endpoint
  sensitive = true
}

output "kubernetes_cluster_ca_certificate" {
  value     = module.gke.ca_certificate
  sensitive = true
}