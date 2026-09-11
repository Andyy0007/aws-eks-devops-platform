# Architecture

## Flow

1. Developer commits to GitHub.
2. GitHub Actions or Jenkins runs unit tests.
3. Docker image is built and pushed to Docker Hub.
4. Terraform creates AWS VPC, subnets, NAT and EKS.
5. Ansible configures the EC2 administration/bastion host.
6. Helm deploys the application to EKS.
7. Kubernetes probes provide health/readiness checks.
8. Prometheus scrapes `/metrics`.
9. Grafana visualizes application and cluster metrics.
10. HPA scales the Flask deployment based on CPU.

## Production improvements

For a production implementation:
- Use GitHub OIDC instead of static AWS keys.
- Store application secrets in AWS Secrets Manager and sync them into Kubernetes.
- Use an AWS Load Balancer Controller and Route 53.
- Use private EKS API endpoints where appropriate.
- Enable CloudTrail, GuardDuty and centralized logging.
- Use Terraform remote state in S3 with locking.
- Pin container image digests.
- Add image scanning and dependency scanning.
- Use separate dev/stage/prod environments.
