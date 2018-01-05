from xld.kubernetes.deployment.deployment_service import DeploymentService
from xld.kubernetes.deployment.deployment_helper import DeploymentHelper
from xld.kubernetes.apps_api_client import KubernetesAppsClient
from xld.kubernetes.deployment.deployment_helper import DeploymentHelper
from xld.kubernetes.factories.handler_factory import ContainerHelperFactory


class MyDeploymentService(DeploymentService):

    def __init__(self):
        self.__deployment_helper = DeploymentHelper()
        self.dump_request = True

    @staticmethod
    def __create_client(container):
        return KubernetesAppsClient(container)

    @staticmethod
    def __create_container_helper(container):
        return ContainerHelperFactory(container).create()

    def should_wait_for_deployment_scale_0(self, deployed, deployment_name):
        client = self.__create_client(deployed.container.container)
        response_deployment = client.read_deployment(deployment_name,
                                                     self.__create_container_helper(
                                                         deployed.container).get_container_name(deployed.container))

        print("-- response_deployment.status.available_replicas %s" % response_deployment.status.available_replicas)

        if response_deployment.status.available_replicas == None or response_deployment.status.available_replicas == 0:
            return False
        else:
            print("Waiting for Deployment's pod {0} available_replicas {1} ".format(deployment_name, response_deployment.status.available_replicas ))
            return True

print("Check minimum_pod_count is zero")
if MyDeploymentService().should_wait_for_deployment_scale_0(deployed=deployed, deployment_name=DeploymentHelper().get_deployment_name(deployed)):
    result = "RETRY"
else:
    print("Deployment created successfully.")
