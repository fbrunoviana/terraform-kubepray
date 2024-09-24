# Cria VPC
resource "google_compute_network" "kubernetes_network" {
  name                    = "kubernetes-the-kubespray-way"
  auto_create_subnetworks = false
}

# Cria subrede
resource "google_compute_subnetwork" "kubernetes_subnet" {
  name          = "kubernetes"
  ip_cidr_range = var.ip_cidr_range
  network       = google_compute_network.kubernetes_network.self_link
  region        = var.region
}

# Cria regra de firewall para tráfego interno
resource "google_compute_firewall" "allow_internal" {
  name    = "kubernetes-the-kubespray-way-allow-internal"
  network = google_compute_network.kubernetes_network.name

  allow {
    protocol = "tcp"
  }

  allow {
    protocol = "udp"
  }

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "udp"
    ports    = ["4789"]
  }

  source_ranges = [var.ip_cidr_range]
}

# Cria regra de firewall para tráfego externo
resource "google_compute_firewall" "allow_external" {
  name    = "kubernetes-the-kubespray-way-allow-external"
  network = google_compute_network.kubernetes_network.name

  allow {
    protocol = "tcp"
    ports    = ["80", "6443", "443", "22"]
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]
}
