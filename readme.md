# Datacube Kubernetes EKS

:warning: This is still a work in progress and doesn't have an official release :warning:

This repository will build and manage a production scale kubernetes cluster using the AWS EKS engine
for running Open Data Cube applications. 

[![Master](https://circleci.com/gh/opendatacube/datacube-k8s-eks/tree/master.svg?style=shield)](https://circleci.com/gh/opendatacube/datacube-k8s-eks/tree/master)

---

# Supported Features

* EKS cluster with PostgreSQL database
* Multi-factor Authentication enforcement for Admin users
* Scale applications based on usage
* Scale cluster to fit application requirements
* Spot instance support
* Send logs to cloudfront
* Application load balancers with automatically generated certificates
* Optional Cloudfront distribution with automatically generated certificates
* Automatically register route53 DNS records
* Inspect cluster metrics using Prometheus and Grafana

# Getting started

Follow our [Getting Started Guide](docs/getting_started.md) to deploy your first cluster and learn how to customise your build.

# Documentation

* [Additional Users](docs/additional_users.md) - How to add users and configure access
* [Patching](docs/patching_upgrading.md) - How to keep the Kubernetes nodes up to date
* [Addons](docs/addons.md) - Notes on how to install and configure various addons
* [Troubleshooting](docs/troubleshooting.md) - Workarounds to fix common issues
* [Service Account](docs/service_account.md) - Creating a service account to build the infrastructure
* [Variables](docs/variables.md) - A list of the configurable variables and what they do

# Repository Layout

* docs - Out of code documentation as above
* examples - Sample Terraform deployments that can be spun-up and destroyed to test the various modules
* odc_eks - Core components required to run an EKS cluster for ODC
* ods_k8s - Kubernetes service pods required to perform Continuous deployment of applications.
  * [Flux](https://www.weave.works/oss/flux/)
  * [Tiller/Helm](https://helm.sh/)
:warning: Soon to be deprecated :warning:
* addons - Kubernetes hosted applications pending refactor to deployment via Flux.
* .circleci - TFLint CI automation
