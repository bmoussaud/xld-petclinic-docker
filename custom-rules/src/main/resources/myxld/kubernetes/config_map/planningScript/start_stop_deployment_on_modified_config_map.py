from xld.kubernetes.deployment.deployment_helper import DeploymentHelper
from xld.kubernetes.factories.handler_factory import ContainerHelperFactory
from xld.kubernetes.pod.pod_helper import PodHelper


def rescale_deployment(delta):
    deployed = delta.deployed
    previousDeployed = delta.previous
    container_helper = ContainerHelperFactory(deployed.container).create()
    deployment_helper = DeploymentHelper()

    context.addStepWithCheckpoint(steps.jython(
        description="{0} Deployment {1} on {2}".format(
            'Scale down',
            DeploymentHelper().get_deployment_name(deployed),
            container_helper.get_container_name(deployed.container)),
        script="myxld/kubernetes/deployment/scale.py",
        order=60,
        jython_context = {'deployed':deployed, 'count':0, 'previousDeployed':previousDeployed}
    ), delta)

    context.addStepWithCheckpoint(steps.jython(
        description="Wait for the Deployment{0} scaled down".format(
            deployment_helper.get_deployment_name(deployed)),
        script="myxld/kubernetes/deployment/wait_for_zero.py",
        order=60,
        jython_context = {'deployed':deployed, 'previousDeployed':previousDeployed},
    ), delta)

    context.addStepWithCheckpoint(steps.jython(
        description="{0} Deployment {1} on {2}".format(
            'Scale up',
            DeploymentHelper().get_deployment_name(deployed),
            container_helper.get_container_name(deployed.container)),
        script="myxld/kubernetes/deployment/scale.py",
        order=62,
        jython_context = {'deployed':deployed, 'count':deployed.replicasCount, 'previousDeployed':previousDeployed}
    ), delta)

    if deployed.minimumPodCount > 0:
        context.addStepWithCheckpoint(steps.jython(
            description="Wait for Deployment {0} to be in running state".format( deployment_helper.get_deployment_name(deployed)),
            script="xld/kubernetes/deployment/wait_for_deployment_ready.py",
            order=62,
            jython_context = {'deployed':deployed, 'previousDeployed':previousDeployed},
        ), delta)


def deployments(modify_config_map, noop_delta_deployment):
    candidates = []
    for delta_v in modify_config_map:
        for delta in noop_delta_deployment:
            deployment = delta.deployed
            if deployment.volumes is None:
                continue
            for v in deployment.volumes:
                volumeName = v.properties['name']
                if v.volumeType == 'configMap' and (volumeName == delta_v.deployed.configMapName or volumeName == delta_v.previous.configMapName): 
                    candidates.append(delta)
    return set(candidates)



modified_config_map = filter(
        lambda delta: delta.operation == 'MODIFY' and delta.deployedOrPrevious.type == 'k8s.ConfigMap',
        deltas.deltas)

print "-- stop start deployment- modified_config_map (%s):%s " % (len(modified_config_map),modified_config_map)

noop_delta_deployment = filter(
        lambda delta: delta.operation == 'NOOP' and delta.deployedOrPrevious.type == 'k8s.Deployment',
        deltas.deltas)

print "-- stop start deployment- noop_delta_deployment (%s):%s " % (len(noop_delta_deployment),noop_delta_deployment)

candidates = deployments(modified_config_map, noop_delta_deployment)

print "-- stop start deployment- candidates %s " % candidates

map(rescale_deployment, candidates)
