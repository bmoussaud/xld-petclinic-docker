# xld-petclinic-docker
A sample Java application that shows how to package war in a tomcat docker image and deploy them with XLDeploy

## Usage
* set the `docker` environment

```
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.123:2376"
export DOCKER_CERT_PATH="/Users/bmoussaud/.docker/machine/machines/docker-machine-virtualbox-1"
export DOCKER_MACHINE_NAME="docker-machine-virtualbox-1"
# Run this command to configure your shell:
# eval "$(docker-machine env docker-machine-virtualbox-1)"
```

* run `mvn clean package` to build the applications and the associated images

To push the images to Docker registries

* local trusted registry (default url is 192.168.99.100:5000)
* docker.hub (edit the ~/.m2/settings.xml)
```
  <server>
     <id>docker.io</id>
     <username>xldeploy</username>
    <password>s!cr!t</password>
  </server>
```


To integrate with *XL Deploy*,
* start XL Deploy version with the default bundled xld-docker-plugin
* run `mvn clean install`. This command `push`the images in the registry
  using a timestamp for version and `import` the XL Deploy DAR file in XL Deploy

![deployment with xld-docker-plugin](docker_deployment.png)


The XL Deploy manifest file for the application:

``` 
<udm.DeploymentPackage version="3.1-20160921-160321" application="PetDocker">
  <orchestrator>
    <value>parallel-by-deployment-group</value>
  </orchestrator>
  <deployables>
    <docker.Image name="ha-proxy">
      <tags />
      <image>eeacms/haproxy:1.6</image>
      <labels>
        <value>zone=front</value>
      </labels>
      <network>petnetwork</network>
      <dependencies>
        <value>petclinic</value>
      </dependencies>
      <volumesFrom />
      <registryHost>{{PROJECT_REGISTRY_HOST}}</registryHost>
      <ports>
        <docker.PortSpec name="ha-proxy/admin">
          <hostPort>1936</hostPort>
          <containerPort>1936</containerPort>
        </docker.PortSpec>
        <docker.PortSpec name="ha-proxy/web">
          <hostPort>80</hostPort>
          <containerPort>5000</containerPort>
        </docker.PortSpec>
      </ports>
      <links />
      <volumes />
      <variables>
        <docker.EnvironmentVariableSpec name="ha-proxy/BACKENDS">
          <value>petclinic:8080</value>
        </docker.EnvironmentVariableSpec>
        <docker.EnvironmentVariableSpec name="ha-proxy/constraint">
          <value>zone==front</value>
          <separator>:</separator>
        </docker.EnvironmentVariableSpec>
      </variables>
    </docker.Image>
    <smoketest.HttpRequestTest name="smoke test - ha">
      <url>http://{{FRONT_HOST_ADDRESS}}/petclinic/</url>
      <expectedResponseText>{{title}}</expectedResponseText>
      <headers />
    </smoketest.HttpRequestTest>
    <docker.Image name="petclinic-backend">
      <image>bmoussaud/petclinic-backend:1.1-20162109140249</image>
      <labels>
        <value>zone=back</value>
      </labels>
      <network>petnetwork</network>
      <dependencies />
      <volumesFrom />
      <registryHost>{{PROJECT_REGISTRY_HOST}}</registryHost>
      <ports />
      <links />
      <volumes />
      <variables>
        <docker.EnvironmentVariableSpec name="petclinic-backend/constraint">
          <value>zone==back</value>
          <separator>:</separator>
        </docker.EnvironmentVariableSpec>
      </variables>
    </docker.Image>
    <smoketest.HttpRequestTest name="smoke test">
      <tags />
      <url>http://{{BACK_HOST_ADDRESS}}:{{HOST_PORT}}/petclinic/</url>
      <expectedResponseText>{{title}}</expectedResponseText>
      <headers />
    </smoketest.HttpRequestTest>
    <sql.SqlScripts name="sql" file="sql/sql">
      <scanPlaceholders>true</scanPlaceholders>
    </sql.SqlScripts>
    <docker.Folder name="petclinic.config" file="petclinic.config/config">
      <volumeName>petclinic-config</volumeName>
      <containerName>petclinic</containerName>
      <containerPath>/application/properties</containerPath>
    </docker.Folder>
    <docker.NetworkSpec name="petnetwork">
      <driver>{{petnetwork}}</driver>
    </docker.NetworkSpec>
    <docker.Image name="petclinic">
      <image>bmoussaud/petclinic:3.1-20162109140249</image>
      <labels>
        <value>zone=back</value>
      </labels>
      <network>petnetwork</network>
      <dependencies>
        <value>petclinic-backend</value>
      </dependencies>
      <registryHost>{{PROJECT_REGISTRY_HOST}}</registryHost>
      <ports>
        <docker.PortSpec name="petclinic/exposed-port">
          <hostPort>{{HOST_PORT}}</hostPort>
          <containerPort>8080</containerPort>
        </docker.PortSpec>
      </ports>
      <links />
      <volumes>
        <docker.VolumeSpec name="petclinic/petclinic-config">
          <source>petclinic-config</source>
          <destination>/application/properties</destination>
        </docker.VolumeSpec>
      </volumes>
      <variables>
        <docker.EnvironmentVariableSpec name="petclinic/constraint">
          <value>zone==back</value>
          <separator>:</separator>
        </docker.EnvironmentVariableSpec>
        <docker.EnvironmentVariableSpec name="petclinic/loglevel">
          <value>{{LOGLEVEL}}</value>
        </docker.EnvironmentVariableSpec>
      </variables>
    </docker.Image>
  </deployables>
  <applicationDependencies />
</udm.DeploymentPackage>

```

Use the following dictionary to configure your deployed application (fake values!)
![configure petdocker](petdocker_dictionary.png)


TODO
* Add you docker-hub entry in your maven setting.xml file.
```

    <server>
      <id>docker-hub</id>
      <username>bmoussaud</username>
      <password>#########</password>
      <configuration>
        <email>bmoussaud@XXXXXXX</email>
      </configuration>
    </server>

```