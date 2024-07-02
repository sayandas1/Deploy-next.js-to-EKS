# Next.js Application Deployment on Amazon EKS using Helm

This repository contains a Helm chart and GitHub Actions workflow to deploy a Next.js application on Amazon EKS (Elastic Kubernetes Service).

## Prerequisites

Before you begin, ensure you have the following set up:

- Amazon EKS cluster
- Amazon ECR repository for Docker images
- AWS IAM role with appropriate permissions for EKS and ECR
- GitHub repository secrets configured for AWS credentials

## Helm Chart Structure

The Helm chart (`helm-chart`) in this repository is structured as follows:

- **values.yaml**: Defines configuration values for deployment such as image repository, tag, service type, and ports.
  
- **templates/**
  - **deployment.yaml**: Kubernetes Deployment configuration to deploy the Next.js application.
  - **service.yaml**: Kubernetes Service configuration to expose the Next.js application.

## GitHub Actions Workflow

The GitHub Actions workflow (`deploy.yml`) automates the deployment process:
- Checks out the code from the repository.
- Builds and pushes the Docker image to Amazon ECR.
- Configures `kubectl` to access the Amazon EKS cluster.
- Deploys the Helm chart to the EKS cluster using `helm upgrade`.

## Getting Started

To deploy your Next.js application to Amazon EKS, follow these steps:

1. Update `values.yaml`:
   - Set `image.repository` to your Amazon ECR repository URL.
   - Optionally, customize other values such as `service.type`, `service.port`, etc.

2. Configure GitHub repository secrets:
   - `AWS_ACCESS_KEY_ID`: AWS IAM access key ID.
   - `AWS_SECRET_ACCESS_KEY`: AWS IAM secret access key.
   - `AWS_REGION`: AWS region where your EKS cluster is located.
   - `ECR_REGISTRY`: URL of your Amazon ECR repository.
   - `EKS_CLUSTER_NAME`: Name of your Amazon EKS cluster.
   - `EKS_ROLE_ARN`: ARN of the IAM role used by EKS.

3. Push changes to your GitHub repository. This triggers the GitHub Actions workflow to deploy your application to EKS.

## Troubleshooting

If you encounter issues during deployment:
- Check GitHub Actions logs for any error messages.
- Verify AWS credentials and permissions.
- Ensure Helm chart configurations (`values.yaml`, `deployment.yaml`, `service.yaml`) are correct.

## Resources

- [Amazon EKS Documentation](https://docs.aws.amazon.com/eks/)
- [Helm Documentation](https://helm.sh/docs/)