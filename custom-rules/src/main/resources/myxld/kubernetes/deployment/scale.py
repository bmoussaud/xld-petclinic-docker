from xld.kubernetes.deployment.deployment_service import DeploymentService
from pprint import pprint


deployment_service = DeploymentService()
deployed.replicasCount = count
deployed.minimumPodCount = count

response_deployment = deployment_service.update_deployment(deployed=deployed, previousDeployed=previousDeployed)
deployed.deploymentName = response_deployment.metadata.name
pprint(response_deployment)
