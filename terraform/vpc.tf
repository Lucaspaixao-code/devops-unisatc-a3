module "vpc" {
  source  = "terraform-google-modules/network/google"
  # Usei uma versão mais estável/comum, mas pode manter a sua se preferir
  version = "~> 9.0"

  project_id   = var.project_id
  network_name = "vpc-network"
  
  subnets = [
    {
      subnet_name   = "subnet-1"
      subnet_ip     = "10.0.0.0/16"
      subnet_region = var.region
    },
  ]

  # CORREÇÃO: Definindo faixas secundárias com NOMES
  secondary_ranges = {
    subnet-1 = [
      {
        range_name    = "pods-range"
        ip_cidr_range = "10.48.0.0/14"
      },
      {
        range_name    = "services-range"
        ip_cidr_range = "10.52.0.0/20"
      },
    ]
  }
}