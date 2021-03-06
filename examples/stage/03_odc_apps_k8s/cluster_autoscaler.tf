data "template_file" "cluster_autoscaler" {
  template = file("${path.module}/config/cluster_autoscaler.yaml")
  vars = {
    cluster_name = local.cluster_id
    region = local.region
    role_name = module.odc_role_autoscaler.role_name
  }
}

resource "kubernetes_secret" "cluster_autoscaler" {
  depends_on = [
    kubernetes_namespace.admin
  ]

  metadata {
    name = "cluster-autoscaler"
    namespace = "admin"
  }

  data = {
    "values.yaml" = data.template_file.cluster_autoscaler.rendered
  }

  type = "Opaque"
}