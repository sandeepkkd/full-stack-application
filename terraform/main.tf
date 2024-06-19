provider "aws" {
  region = "us-east-1"
}

resource "aws_ecs_cluster" "customer_portal_cluster" {
  name = "customer-portal-cluster"
}

// Add other resources like ECS services, task definitions, and load balancers
