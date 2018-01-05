from xld.kubernetes.apps_api_client import KubernetesAppsClient
from xld.kubernetes.deployment.deployment_helper import DeploymentHelper
from xld.kubernetes.factories.handler_factory import ContainerHelperFactory
from pprint import pprint



deployment_name=DeploymentHelper().get_deployment_name(deployed)
print "deployment_name %s" % deployment_name

namespace_name = ContainerHelperFactory(deployed.container).create().get_container_name(deployed.container)
print "namespace_name %s "% namespace_name

client = KubernetesAppsClient(deployed.container.container)
print "client %s" % client
print "client.get_apps_api %s" % client.get_apps_api()

#current_deployment = client.get_apps_api().read_namespaced_deployment_scale(name=deployment_name, namespace=namespace_name) if kubernetes python module > 1.0.2
current_deployment = client.get_apps_api().read_namespaced_deployment(name=deployment_name, namespace=namespace_name)
pprint(current_deployment)
print("Current number of workers is %s" %  current_deployment.spec.replicas)
current_deployment.spec.replicas = count
print("Scaling to %s" % current_deployment.spec.replicas)
#current_deployment = client().get_apps_api().replace_namespaced_deployment_scale(name, namespace,current_deployment) if kubernetes python module > 1.0.2
current_deployment = client.get_apps_api().replace_namespaced_deployment(name=deployment_name,namespace=namespace_name,body=current_deployment)
pprint(current_deployment)



