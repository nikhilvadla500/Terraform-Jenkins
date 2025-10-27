
# 1. VPC Configuration
resource "google_compute_network" "vpc_network" {
  name                    = "vpc-network"
  auto_create_subnetworks = false # Disable auto-creation of subnets
}

# 2. Subnet Configuration
resource "google_compute_subnetwork" "subnet" {
  name          = "subnet-1"
  network       = google_compute_network.vpc_network.name
  ip_cidr_range = "10.0.0.0/24"
  region        = "us-central1"
}

# 3. Google Cloud Storage Bucket
resource "google_storage_bucket" "terraform-nikhil" {
  name     = "terraform-nikhil"
  location = "US"
}

# 4. VM Instance Configuration
resource "google_compute_instance" "vm_instance" {
  count        = var.instance_count                        # Creates multiple instances based on variable
  name         = "${var.instance_name}-${count.index + 1}" # Unique name per instance
  machine_type = var.instance_machine_type                 # Machine type from variable
  zone         = var.zone                                  # Zone from variable

  # Boot disk configuration for the VM
  boot_disk {
    initialize_params {
      image = "debian-11"
      size  = 10 # 10 GB boot disk size
    }
  }

  network_interface {
    network    = google_compute_network.vpc_network.name
    subnetwork = google_compute_subnetwork.subnet.name
    access_config {
      # Allocate a public IP address
    }
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    echo "Hello, World!" > /var/www/html/index.html
  EOT
}

