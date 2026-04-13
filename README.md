## INTERVIEW TASK - SIMPLE APP DEPLOYMENT

OVERVIEW:
This project demonstrates a complete end-to-end implementation on Azure, covering infrastructure provisioning, containerization, Kubernetes deployment, and secure secrets management.
The infrastructure is provisioned using Terraform, which creates an Azure Kubernetes Service (AKS) cluster, Azure Container Registry (ACR), Log Analytics workspace, and Azure Key Vault. The application is a simple Python Flask app that is containerized using Docker and deployed to AKS.
The application securely retrieves its configuration from Azure Key Vault using the Secrets Store CSI Driver, ensuring that sensitive data is never hardcoded or exposed.
Additionally, the project is structured in a modular way and is CI/CD ready, allowing easy integration with GitHub Actions for automated build and deployment

Moniotr and Logging Enabled: 
Infrastructure level:
 * Cluster Logs and Node logs
 * Containter stdout and stderr logs

Secrets Management implemented: 
* Secrets stored in Azure Key Vault
* Accessed using:AKS Managed Identity
* Secrets Store CSI Driver

Based on APP requirement we can enhance app config with below setup.
Ingress with custom domain + HTTPS
Horizontal Pod Autoscaler (HPA)
Helm charts
Monitoring with Prometheus & Grafana

To access APP http://40.76.153.104/
