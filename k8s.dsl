xld {
  scope(
    forInfrastructure: 'Infrastructure/K8S'
  ) {
    infrastructure('local', 'overthere.LocalHost') {
      os = com.xebialabs.overthere.OperatingSystemFamily.UNIX
      infrastructure('test runner', 'smoketest.Runner') {
        host = ref('Infrastructure/K8S/local')
        // no Deployfile renderer found for 'Infrastructure/K8S/local/test runner/smoke test petclinic ui' [type: smoketest.ExecutedHttpRequestTest]
      }
    }
    infrastructure('minikube', 'k8s.Master') {
      apiServerURL = 'https://192.168.99.100:8443'
      skipTLS = true
      tlsCert = '-----BEGIN CERTIFICATE-----\n' +
                'MIIDhDCCAmygAwIBAgIBAjANBgkqhkiG9w0BAQsFADAVMRMwEQYDVQQDEwptaW5p\n' +
                'a3ViZUNBMB4XDTE4MDEwODE0MzE0NFoXDTE5MDEwODE0MzE0NFowLDEXMBUGA1UE\n' +
                'ChMOc3lzdGVtOm1hc3RlcnMxETAPBgNVBAMTCG1pbmlrdWJlMIIBIjANBgkqhkiG\n' +
                '9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4/8thXZNV1PP554gjE6MRFBH5tHuIvbStZN9\n' +
                '9EHEpCNnFhWgrD+8M/b5KvhemumNXDNsl6VPBBfQDx28Nbb57LgeTtTzNyDyHTWu\n' +
                'pLgRopnjFISGHo8T2NhD96+2NiJGS1z1ClotA9/w4Phi+8eLjQ8+k2Rcar80zBQn\n' +
                'kMLJUIfAZHv1p76hcvP05dCvNOWMFhBDOayNOI063vtBWp8LgfD1kzaAgst2+Kni\n' +
                'UQvVSWTRGTBZ1tPLmON3FO7XIW4iZ2VYgiNsmOF2pkaNTrDdBUNXfLa9zt2i+mZM\n' +
                'IsOdmGKwfLQgovxZRlpZIDN1Zmtk+nloLWXUqczgP6kYtU5rmQIDAQABo4HHMIHE\n' +
                'MA4GA1UdDwEB/wQEAwIFoDAdBgNVHSUEFjAUBggrBgEFBQcDAQYIKwYBBQUHAwIw\n' +
                'DAYDVR0TAQH/BAIwADCBhAYDVR0RBH0we4Ika3ViZXJuZXRlcy5kZWZhdWx0LnN2\n' +
                'Yy5jbHVzdGVyLmxvY2FsghZrdWJlcm5ldGVzLmRlZmF1bHQuc3ZjghJrdWJlcm5l\n' +
                'dGVzLmRlZmF1bHSCCmt1YmVybmV0ZXOCCWxvY2FsaG9zdIcEwKhjZIcECmAAAYcE\n' +
                'CgAAATANBgkqhkiG9w0BAQsFAAOCAQEABmEf0uiCHbtiuPhoW1oTOKFOoFoHUyy5\n' +
                'Vxm0bh7yzvVJXie0/lN4ZiUTbBOIEBQLvpwH6J+orlup5S1rpVMjIoCacsUiBGEn\n' +
                'cQUA6nyWpg4WYa8tjsrWqQtlQQB47ke1+ERitSJb9SFQvMiBC2dhKlQruwrGM2Bb\n' +
                'gcB6+VEkX4bfb4Wc17rfMl501AfVh3bv5jydjcAFj0i92+k57awIkGMWc5UvkREr\n' +
                'wxuIyCyoR18ByYcR/m+vAGgjJIJAUipsHRaFvJj2q/eq80WTzgMfUbEAnCXnzBpu\n' +
                'Gj+TRVxFXl+DJD7OXNOkMhob5127atEa2obf5Rx2r5I+fX9wyuKGyg==\n' +
                '-----END CERTIFICATE-----'
      tlsPrivateKey = '-----BEGIN RSA PRIVATE KEY-----\n' +
                      'MIIEpQIBAAKCAQEA4/8thXZNV1PP554gjE6MRFBH5tHuIvbStZN99EHEpCNnFhWg\n' +
                      'rD+8M/b5KvhemumNXDNsl6VPBBfQDx28Nbb57LgeTtTzNyDyHTWupLgRopnjFISG\n' +
                      'Ho8T2NhD96+2NiJGS1z1ClotA9/w4Phi+8eLjQ8+k2Rcar80zBQnkMLJUIfAZHv1\n' +
                      'p76hcvP05dCvNOWMFhBDOayNOI063vtBWp8LgfD1kzaAgst2+KniUQvVSWTRGTBZ\n' +
                      '1tPLmON3FO7XIW4iZ2VYgiNsmOF2pkaNTrDdBUNXfLa9zt2i+mZMIsOdmGKwfLQg\n' +
                      'ovxZRlpZIDN1Zmtk+nloLWXUqczgP6kYtU5rmQIDAQABAoIBAQC8Y7WxebceWVqI\n' +
                      '/9fVF3I/YDaJOx2SNnCVKHICyfU5yyb60JQav+864O+x2dgSGLl9XeB0zVsk/qgk\n' +
                      'VWWW3MJWHyyr5rmw68Ai8qCD6rRnrtA7u+U2ivLTUp+WodHlmRyMWRsAmtJnSTs4\n' +
                      'KQVhFdjxjY8fKuZSLfvqRR0MOGcv6evdZ1znC87EVMSam9sun2f1mKVCcwQHNpKn\n' +
                      'MmswNG2l6VYuh2M+8uQIhDdXRyOvOWucddObaJtPO68y2r6y5lAwx4hG2irdFAFu\n' +
                      '0mjrCecwmriGGRO7SBgBxc0Wi3hL7jnXJE5jbpORN6Ic9wOYOKZ8P7+DBvwAqS5C\n' +
                      'g9xQ2/gBAoGBAP/hjoQutqS//XgV8kxaIp2jaPU2TbZdFa/6yy+GGRJomIe/en+5\n' +
                      'mAQUwUFetcrUacGMFiVSLcAK+FoYVg55ylhQBfVF+a5NQytbEogprGNAGnLOUZIy\n' +
                      '1tp/GKqG8sTdvJxUwXAoqjz4nI+lsNyphHMbp3TksJsIt0E1slWs2gx5AoGBAOQa\n' +
                      'TbiBWR7GFTFKGVtuIba3VLGKFQXbOk3Szf4TdO02bvM3jSyWuIV7OSWjfVvthml+\n' +
                      '83pKC9x4SlmeRA+T1iZ9Egq1D3Ng6oHkRzvOSLqxv9NRdxaPreRO1oFdrP/MqGVx\n' +
                      'SempfvgchelzvDFrMScY1/Ii5UKrddbOH5zGdVAhAoGAAtWm1IQH9e9CiZAErR/a\n' +
                      'flCPGxhM6BZD5T0r/wzHPlL2TZqrarrNmk34jhbUgLi1qzU4EZXFd/knIyhd268x\n' +
                      'tKS+TCdISswEUHijzepYRIkzQc5TTQFPLAB4b3srOU8Thc/SjMGGkUJXyaeWO/uM\n' +
                      'whGuWzclVbJVBV3o6dYOXFECgYEAm5RFRn8S5iZ89e1wdigb3qAUqDNiO2hX0BTk\n' +
                      'Y1OqANGLw2A0biEvIfv18nIcYsMTVok8UECI7ostSwrjqSxQeFf+Ikd0jmGgEZA9\n' +
                      '9dCxUoVCLUP3UfAVzw7mx7247ZANm4M1wqXU8C2kOKKzzZErKVuMjp62eE6yRRy5\n' +
                      '+xhxk4ECgYEAt66RQb49O5TcY+++Y80cRIELiY3W732vchnVtTK0l/wnbK0wIzsa\n' +
                      '8ZFibDXBo97CF8pAaZKFS2n6Iqqo3uVzy7z8ayXDa+b4Br3EKxeE8DA4KHBzZquU\n' +
                      'agnGFpzL8viMR0PW4AFCUqPcdsPLetl+JoXSM4ddW0RScaozgYokJmU=\n' +
                      '-----END RSA PRIVATE KEY-----'
      // no Deployfile renderer found for 'Infrastructure/K8S/minikube/default' [type: k8s.Namespace]
      // no Deployfile renderer found for 'Infrastructure/K8S/minikube/dev' [type: k8s.Namespace]
    }
  }
  scope(
    forInfrastructure: 'Infrastructure/K8S'
  ) {
    infrastructure('local', 'overthere.LocalHost') {
      os = com.xebialabs.overthere.OperatingSystemFamily.UNIX
      infrastructure('test runner', 'smoketest.Runner') {
        host = ref('Infrastructure/K8S/local')
        // no Deployfile renderer found for 'Infrastructure/K8S/local/test runner/smoke test petclinic ui' [type: smoketest.ExecutedHttpRequestTest]
      }
    }
    infrastructure('minikube', 'k8s.Master') {
      apiServerURL = 'https://192.168.99.100:8443'
      skipTLS = true
      tlsCert = '-----BEGIN CERTIFICATE-----\n' +
                'MIIDhDCCAmygAwIBAgIBAjANBgkqhkiG9w0BAQsFADAVMRMwEQYDVQQDEwptaW5p\n' +
                'a3ViZUNBMB4XDTE4MDEwODE0MzE0NFoXDTE5MDEwODE0MzE0NFowLDEXMBUGA1UE\n' +
                'ChMOc3lzdGVtOm1hc3RlcnMxETAPBgNVBAMTCG1pbmlrdWJlMIIBIjANBgkqhkiG\n' +
                '9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4/8thXZNV1PP554gjE6MRFBH5tHuIvbStZN9\n' +
                '9EHEpCNnFhWgrD+8M/b5KvhemumNXDNsl6VPBBfQDx28Nbb57LgeTtTzNyDyHTWu\n' +
                'pLgRopnjFISGHo8T2NhD96+2NiJGS1z1ClotA9/w4Phi+8eLjQ8+k2Rcar80zBQn\n' +
                'kMLJUIfAZHv1p76hcvP05dCvNOWMFhBDOayNOI063vtBWp8LgfD1kzaAgst2+Kni\n' +
                'UQvVSWTRGTBZ1tPLmON3FO7XIW4iZ2VYgiNsmOF2pkaNTrDdBUNXfLa9zt2i+mZM\n' +
                'IsOdmGKwfLQgovxZRlpZIDN1Zmtk+nloLWXUqczgP6kYtU5rmQIDAQABo4HHMIHE\n' +
                'MA4GA1UdDwEB/wQEAwIFoDAdBgNVHSUEFjAUBggrBgEFBQcDAQYIKwYBBQUHAwIw\n' +
                'DAYDVR0TAQH/BAIwADCBhAYDVR0RBH0we4Ika3ViZXJuZXRlcy5kZWZhdWx0LnN2\n' +
                'Yy5jbHVzdGVyLmxvY2FsghZrdWJlcm5ldGVzLmRlZmF1bHQuc3ZjghJrdWJlcm5l\n' +
                'dGVzLmRlZmF1bHSCCmt1YmVybmV0ZXOCCWxvY2FsaG9zdIcEwKhjZIcECmAAAYcE\n' +
                'CgAAATANBgkqhkiG9w0BAQsFAAOCAQEABmEf0uiCHbtiuPhoW1oTOKFOoFoHUyy5\n' +
                'Vxm0bh7yzvVJXie0/lN4ZiUTbBOIEBQLvpwH6J+orlup5S1rpVMjIoCacsUiBGEn\n' +
                'cQUA6nyWpg4WYa8tjsrWqQtlQQB47ke1+ERitSJb9SFQvMiBC2dhKlQruwrGM2Bb\n' +
                'gcB6+VEkX4bfb4Wc17rfMl501AfVh3bv5jydjcAFj0i92+k57awIkGMWc5UvkREr\n' +
                'wxuIyCyoR18ByYcR/m+vAGgjJIJAUipsHRaFvJj2q/eq80WTzgMfUbEAnCXnzBpu\n' +
                'Gj+TRVxFXl+DJD7OXNOkMhob5127atEa2obf5Rx2r5I+fX9wyuKGyg==\n' +
                '-----END CERTIFICATE-----'
      tlsPrivateKey = '-----BEGIN RSA PRIVATE KEY-----\n' +
                      'MIIEpQIBAAKCAQEA4/8thXZNV1PP554gjE6MRFBH5tHuIvbStZN99EHEpCNnFhWg\n' +
                      'rD+8M/b5KvhemumNXDNsl6VPBBfQDx28Nbb57LgeTtTzNyDyHTWupLgRopnjFISG\n' +
                      'Ho8T2NhD96+2NiJGS1z1ClotA9/w4Phi+8eLjQ8+k2Rcar80zBQnkMLJUIfAZHv1\n' +
                      'p76hcvP05dCvNOWMFhBDOayNOI063vtBWp8LgfD1kzaAgst2+KniUQvVSWTRGTBZ\n' +
                      '1tPLmON3FO7XIW4iZ2VYgiNsmOF2pkaNTrDdBUNXfLa9zt2i+mZMIsOdmGKwfLQg\n' +
                      'ovxZRlpZIDN1Zmtk+nloLWXUqczgP6kYtU5rmQIDAQABAoIBAQC8Y7WxebceWVqI\n' +
                      '/9fVF3I/YDaJOx2SNnCVKHICyfU5yyb60JQav+864O+x2dgSGLl9XeB0zVsk/qgk\n' +
                      'VWWW3MJWHyyr5rmw68Ai8qCD6rRnrtA7u+U2ivLTUp+WodHlmRyMWRsAmtJnSTs4\n' +
                      'KQVhFdjxjY8fKuZSLfvqRR0MOGcv6evdZ1znC87EVMSam9sun2f1mKVCcwQHNpKn\n' +
                      'MmswNG2l6VYuh2M+8uQIhDdXRyOvOWucddObaJtPO68y2r6y5lAwx4hG2irdFAFu\n' +
                      '0mjrCecwmriGGRO7SBgBxc0Wi3hL7jnXJE5jbpORN6Ic9wOYOKZ8P7+DBvwAqS5C\n' +
                      'g9xQ2/gBAoGBAP/hjoQutqS//XgV8kxaIp2jaPU2TbZdFa/6yy+GGRJomIe/en+5\n' +
                      'mAQUwUFetcrUacGMFiVSLcAK+FoYVg55ylhQBfVF+a5NQytbEogprGNAGnLOUZIy\n' +
                      '1tp/GKqG8sTdvJxUwXAoqjz4nI+lsNyphHMbp3TksJsIt0E1slWs2gx5AoGBAOQa\n' +
                      'TbiBWR7GFTFKGVtuIba3VLGKFQXbOk3Szf4TdO02bvM3jSyWuIV7OSWjfVvthml+\n' +
                      '83pKC9x4SlmeRA+T1iZ9Egq1D3Ng6oHkRzvOSLqxv9NRdxaPreRO1oFdrP/MqGVx\n' +
                      'SempfvgchelzvDFrMScY1/Ii5UKrddbOH5zGdVAhAoGAAtWm1IQH9e9CiZAErR/a\n' +
                      'flCPGxhM6BZD5T0r/wzHPlL2TZqrarrNmk34jhbUgLi1qzU4EZXFd/knIyhd268x\n' +
                      'tKS+TCdISswEUHijzepYRIkzQc5TTQFPLAB4b3srOU8Thc/SjMGGkUJXyaeWO/uM\n' +
                      'whGuWzclVbJVBV3o6dYOXFECgYEAm5RFRn8S5iZ89e1wdigb3qAUqDNiO2hX0BTk\n' +
                      'Y1OqANGLw2A0biEvIfv18nIcYsMTVok8UECI7ostSwrjqSxQeFf+Ikd0jmGgEZA9\n' +
                      '9dCxUoVCLUP3UfAVzw7mx7247ZANm4M1wqXU8C2kOKKzzZErKVuMjp62eE6yRRy5\n' +
                      '+xhxk4ECgYEAt66RQb49O5TcY+++Y80cRIELiY3W732vchnVtTK0l/wnbK0wIzsa\n' +
                      '8ZFibDXBo97CF8pAaZKFS2n6Iqqo3uVzy7z8ayXDa+b4Br3EKxeE8DA4KHBzZquU\n' +
                      'agnGFpzL8viMR0PW4AFCUqPcdsPLetl+JoXSM4ddW0RScaozgYokJmU=\n' +
                      '-----END RSA PRIVATE KEY-----'
      // no Deployfile renderer found for 'Infrastructure/K8S/minikube/default' [type: k8s.Namespace]
      // no Deployfile renderer found for 'Infrastructure/K8S/minikube/dev' [type: k8s.Namespace]
    }
  }
}
