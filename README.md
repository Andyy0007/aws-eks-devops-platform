# AWS EKS DevOps Platform

End-to-end AWS DevOps platform using Terraform, Ansible, Docker, Kubernetes, Helm, GitHub Actions, Jenkins, Prometheus and Grafana.

## Architecture

GitHub → CI/CD → Docker → AWS EKS → Helm → Prometheus/Grafana

## Technologies

- AWS: VPC, EKS, EC2
- IaC: Terraform
- Configuration management: Ansible
- Containers: Docker
- Orchestration: Kubernetes
- Packaging: Helm
- CI/CD: GitHub Actions, Jenkins
- Monitoring: Prometheus, Grafana
- Application: Python Flask + PostgreSQL

See the project documentation for deployment, architecture and troubleshooting details.