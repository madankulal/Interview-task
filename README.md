## INTERVIEW TASK - SIMPLE APP DEPLOYMENT

This project demonstrates an end-to-end DevOps implementation on Azure, covering infrastructure provisioning, containerization, Kubernetes deployment, and secure secrets management.

The infrastructure is provisioned using Terraform, which creates an Azure Kubernetes Service (AKS) cluster, Azure Container Registry (ACR), Log Analytics workspace, and Azure Key Vault.

A Python Flask application is containerized using Docker and deployed to AKS with high availability using multiple replicas.

The application securely retrieves its configuration from Azure Key Vault using the Secrets Store CSI Driver, ensuring that sensitive data is never hardcoded.

FLOW - User → LoadBalancer → AKS Cluster → Application Pod -> Azure Key Vault

Repo:

app/                  # Flask application
terraform/            # Infrastructure code (modular)
kubernetes/           # Kubernetes manifests
.github/workflows/    # CI/CD pipeline
 README.md

## Tools/Tech stack:
Terraform – Infrastructure as Code
Azure Kubernetes Service (AKS) – Container orchestration
Azure Container Registry (ACR) – Image storage
Docker – Containerization
Azure Key Vault – Secure secret management
Kubernetes – Deployment and scaling
GitHub Actions – CI/CD pipeline

## Deployment steps:
1. Provision Infrastructure
   terraform init
   terraform apply
   
2. Build and Push Docker Image
   docker build -t aks-demo:v1 .
   docker tag aks-demo:v1 <acr-name>.azurecr.io/aks-demo:v1
   docker push <acr-name>.azurecr.io/aks-demo:v1

3. Connect to AKS
  az aks get-credentials \
  --resource-group <rg-name> \
  --name <cluster-name>

4. Deploy Application
   * Note: Replace <client-id> and <tenant-id> in secret-provider.yaml with your own Azure credentials before deployment.
   kubectl apply -f kubernetes/secret-provider.yaml
   kubectl apply -f kubernetes/deployment.yaml
   kubectl apply -f kubernetes/service.yaml

6. Access Application
   kubectl get svc
   Open in browser:
   http://<external-ip>
   
## Secrets Management :   
Secrets are stored in Azure Key Vault and accessed securely using:
AKS Managed Identity
Secrets Store CSI Driver
Secrets are mounted inside the container at:
/mnt/secrets/APP-MESSAGE

## Application Logic:
The application retrieves configuration in the following order:
Azure Key Vault (mounted file)
Environment variable
Default fallback

## Logging:
Application logs are generated using Python logging
Logs can be viewed using:
kubectl logs <pod-name>

## CI-CD:
GitHub Actions is used to:
Build Docker image
Push image to Azure Container Registry
Deploy updated image to AKS

## Future Improvements
We can Use Terraform remote backend (Azure Storage)
Add Kubernetes readiness & liveness probes
Implement Helm for templating
Add monitoring (Prometheus & Grafana)
Enable autoscaling (HPA)
Use separate environments (dev/stage/prod)




