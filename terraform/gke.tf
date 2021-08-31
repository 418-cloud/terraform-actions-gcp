resource "google_service_account" "gke_sa" {
  account_id   = "gke-service-account"
  display_name = "GKE Service Account"
}

resource "google_container_cluster" "demo" {
  name                     = "demo-gke-cluster"
  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "gke-node-pool"
  cluster    = google_container_cluster.demo.name
  node_count = 4

  node_config {
    preemptible  = true
    machine_type = "e2-medium"

    service_account = google_service_account.gke_sa.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}