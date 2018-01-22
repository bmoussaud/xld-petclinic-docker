xld {
  scope(
    forInfrastructure: 'Infrastructure/OpenShift'
  ) {
    infrastructure('local', 'overthere.LocalHost') {
      os = com.xebialabs.overthere.OperatingSystemFamily.UNIX
      infrastructure('runner', 'smoketest.Runner') {
        host = ref('Infrastructure/OpenShift/local')
        // no Deployfile renderer found for 'Infrastructure/OpenShift/local/runner/smoke test petclinic ui' [type: smoketest.ExecutedHttpRequestTest]
      }
    }
    infrastructure('minishift', 'openshift.Server') {
      serverUrl = 'https://192.168.64.2:8443'
      openshiftToken = '' //Encrypted value removed for export
      verifyCertificates = false
      // no Deployfile renderer found for 'Infrastructure/OpenShift/minishift/My Project' [type: openshift.Project]
    }
  }
  scope(
    forEnvironments: 'Environments/OpenShift'
  ) {
    environment('Openshift') {
      members = [
        ref('Infrastructure/OpenShift/local/runner'),
        ref('Infrastructure/OpenShift/minishift/My Project')
      ]
      dictionaries = [
        ref('Environments/OpenShift/openshift.dict')
      ]
    }
    dictionary('openshift.dict', [
      'logFilePath': '/dev/null',
      'provider': 'openshift',
      'smoke.test.url': 'http://petclinic-myproject.192.168.64.2.nip.io/petclinic',
      'title': 'RIRIRO',
      'timeout': '1000',
      'logLevel': 'DEBUG'
    ])
  }
}
