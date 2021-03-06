module "jhub_cognito_auth" {
  # source = "github.com/opendatacube/datacube-k8s-eks//cognito?ref=terraform-aws-odc"
  source = "../../../cognito"

  auto_verify = true
  user_pool_name       = "${local.cluster_id}-jhub-userpool"
  user_pool_domain     = "${local.cluster_id}-jhub-auth"
  callback_url         = "https://${local.sandbox_host_name}/oauth_callback"
  user_groups = [
    {
      name        = "dev-group"
      description = "Group defines Jupyterhub dev users"
      precedence  = 5
    },
    {
      name        = "internal-group"
      description = "Group defines Jupyterhub internal users"
      precedence  = 6
    },
    {
      name        = "trusted-group"
      description = "Group defines Jupyterhub trusted users"
      precedence  = 7
    },
    {
      name        = "default-group"
      description = "Group defines Jupyterhub default users"
      precedence  = 10
    }
  ]

  # Tags
  owner       = local.owner
  namespace   = local.namespace
  environment = local.environment
}