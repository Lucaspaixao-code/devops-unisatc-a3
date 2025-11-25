provider "google" {
  project = var.project_id
  region  = var.region
}

module "gke" {
  source                     = "terraform-google-modules/kubernetes-engine/google"
  project_id                 = var.project_id
  name                       = var.cluster_name
  region                     = var.region
  network                    = module.vpc.network_name
  subnetwork                 = module.vpc.subnets_names[0]
  ip_range_pods              = "10.0.0.0/14"
  ip_range_services          = "10.4.0.0/20"
  enable_shielded_nodes      = true
  release_channel            = "STABLE"
}
