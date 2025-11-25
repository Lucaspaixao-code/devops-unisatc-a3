# Adicionamos este bloco para travar a versão do Provider e evitar conflitos
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

module "gke" {
  source                     = "terraform-google-modules/kubernetes-engine/google"
  # Fixamos a versão do módulo para garantir estabilidade
  version                    = "31.1.0"
  
  project_id                 = var.project_id
  name                       = var.cluster_name
  region                     = var.region
  network                    = module.vpc.network_name
  subnetwork                 = module.vpc.subnets_names[0]
  
  # CORREÇÃO: Referenciando os NOMES das faixas criadas no vpc.tf
  ip_range_pods              = "pods-range"
  ip_range_services          = "services-range"
  
  enable_shielded_nodes      = true
  release_channel            = "STABLE"
}