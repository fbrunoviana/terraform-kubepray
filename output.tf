# Output do IP externo do controller-0
output "controller_0_ip" {
  value = google_compute_instance.controller[0].network_interface[0].access_config[0].nat_ip
}

# Output da lista de todas as instâncias
output "kubernetes_instances" {
  value = concat(
    [for instance in google_compute_instance.controller : "${instance.name}: ${instance.network_interface[0].access_config[0].nat_ip}"],
    [for instance in google_compute_instance.worker : "${instance.name}: ${instance.network_interface[0].access_config[0].nat_ip}"]
  )
}
