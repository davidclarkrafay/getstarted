resource "rafay_eks_cluster" "eks-cluster-1" {
    cluster {
    kind = "Cluster"
    metadata {
      name    = "eks-cluster-1"
      project = "david-clark-demo-project"
    }
    spec {
      type           = "eks"
      blueprint      = "minimal"
      blueprint_version = "latest"
      cloud_provider = "eks-role"
      cni_provider   = "aws-cni"
      #proxy_config   = {}
    }
  }
  cluster_config {
    apiversion = "rafay.io/v1alpha5"
    kind       = "ClusterConfig"
    metadata {
      name    = "eks-cluster-1"
      region  = "us-west-2"
      version = "latest"
    }
    iam {
      with_oidc = true
    }
    vpc {
      cidr = "192.168.0.0/16"
      cluster_endpoints {
        private_access = true
        public_access  = true
      }
      nat {
        gateway = "Single"
      }
    }
    node_groups {
      disable_pods_imds = false
      name       = "ng-1"
      ami_family = "AmazonLinux2"
      iam {
      }
      instance_type    = "m5.xlarge"
      desired_capacity = 1
      min_size         = 1
      max_size         = 2
      max_pods_per_node = 50
      version          = "latest"
      volume_size      = 80
      volume_type      = "gp3"
      private_networking = true
      volume_throughput = 125
      efa_enabled = false
      volume_iops = 3000
      disable_imdsv1 = false
    }
    addons {
      name = "vpc-cni"
      version = "latest"
    }
    addons {
      name = "kube-proxy"
      version = "latest"

    }
    addons {
      name = "coredns"
      version = "latest"
    }
  }
}
