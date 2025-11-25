module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "6.1.0"

  project_id   = var.project_id
  network_name = "vpc-network"
  subnets = [
    {
      subnet_name   = "subnet-1"
      subnet_ip     = "10.0.0.0/16"
      subnet_region = var.region
    },
  ]
}