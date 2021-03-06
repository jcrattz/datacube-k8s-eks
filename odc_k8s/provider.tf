data "aws_caller_identity" "current" {
}

data "aws_eks_cluster" "cluster" {
  name = var.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = data.aws_eks_cluster.cluster.id
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
  load_config_file       = false
  version                = "~> 1.10"
}

provider "helm" {
  # TODO: The latest helm release 1.0.0 has a breaking change that removes support for Helm 2 and tiller.
  #       We need to do testing before upgrade. So, pinnig the helm version.
  version = "0.10.4"
  kubernetes {
    load_config_file       = false
    host                   = data.aws_eks_cluster.cluster.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
    token                  = data.aws_eks_cluster_auth.cluster.token
  }
  install_tiller = false
}

