# Crie as instâncias de controladores
resource "google_compute_instance" "controller" {
  count        = var.quantidade_control_plane
  name         = "controller-${count.index}"
  machine_type = var.tipo_da_maquina
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.sistema_operacional
      size  = var.disk_size
    }
  }

  network_interface {
    network    = google_compute_network.kubernetes_network.name
    subnetwork = google_compute_subnetwork.kubernetes_subnet.name
    network_ip = "10.240.0.1${count.index}"
    access_config {}
  }

  can_ip_forward = true

  service_account {
    scopes = ["compute-rw", "storage-ro", "service-management", "service-control", "logging-write", "monitoring"]
  }

  metadata = {
    ssh-keys = "${var.user_so}:${file("${var.chave_ssh}")}"
  }

  tags = ["kubernetes-the-kubespray-way", "controller"]
}

# Crie as instâncias de workers
resource "google_compute_instance" "worker" {
  count        = var.quantidade_workers
  name         = "worker-${count.index}"
  machine_type = var.tipo_da_maquina
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.sistema_operacional
      size  = var.disk_size
    }
  }

  network_interface {
    network    = google_compute_network.kubernetes_network.name
    subnetwork = google_compute_subnetwork.kubernetes_subnet.name
    network_ip = "10.240.0.2${count.index}"
    access_config {}
  }

  can_ip_forward = true

  service_account {
    scopes = ["compute-rw", "storage-ro", "service-management", "service-control", "logging-write", "monitoring"]
  }

  metadata = {
    ssh-keys = "${var.user_so}:${file("${var.chave_ssh}")}"
  }

  tags = ["kubernetes-the-kubespray-way", "worker"]
}