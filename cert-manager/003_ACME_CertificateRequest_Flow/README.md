## ACME Certificate Request Controller
- The ACME Request controller does a set of validations on the private key and other fields set on the CertificateRequest object.
- Once the checks pass, it creates an order object

### 1. CertificateRequest gets validated

```
{
	"metadata": {
		"name": "<name>",
		"namespace": "<namespace>"
	},
	"spec": {
		"issuerRef": {
			"name": "acme-issuer",
			"kind": "Issuer"
		},
		"request": "<CSR Encoded in base64 format>",
		"username": "kubernetes-admin",
		"groups": ["system:masters", "system:authenticated"]
	},
	"status": {
		"conditions": [{
			"type": "Approved",
			"status": "True",
			"lastTransitionTime": "2022-09-27T07:50:00Z",
			"reason": "cert-manager.io",
			"message": "Certificate request has been approved by cert-manager.io"
		}]
	}
}
```

The certificate request controller checks the validity of the CSR. If the CSR is valid and all fields are set with allowed values, it proceeds!

### 2. Order Creation
The certificate request controller creates an order object with structure similar to shown below

```
{
	"metadata": {
		"name": "<order_name>",
		"namespace": "<order_namespace>",		
		"annotations": {
			"cert-manager.io/certificate-name": "test-acme-certificate",
			"cert-manager.io/certificate-revision": "1",
			"cert-manager.io/private-key-secret-name": "test-acme-certificate-t8qdq"
		},
		"ownerReferences": [{
			"apiVersion": "cert-manager.io/v1",
			"kind": "CertificateRequest",
			"name": "test-acme-certificate-947px",
			"uid": "36856766-9233-47e0-a909-f4a809909a36",
			"controller": true,
			"blockOwnerDeletion": true
		}]
	},
	"spec": {
		"request": "<base64 encoded CSR>",
		"issuerRef": {
			"name": "test-acme-issuer"
		},
		"dnsNames": ["nmqvs.ingress-nginx.http01.example.com"],
		"duration": "1h0m0s"
	},
	"status": {}
}
```
### 3. Challenge creation
```
[{
	"metadata": {
		"name": "test-acme-certificate-cdtx5-3610218262-661302092",
		"namespace": "e2e-tests-create-acme-certificate-duration-xrdnq",
		"creationTimestamp": null,
		"ownerReferences": [{
			"apiVersion": "acme.cert-manager.io/v1",
			"kind": "Order",
			"name": "test-acme-certificate-cdtx5-3610218262",
			"uid": "6f28e70b-84de-41b1-8d2f-3d12e241c4fa",
			"controller": true,
			"blockOwnerDeletion": true
		}]
	},
	"spec": {
		"url": "https://pebble.pebble.svc.cluster.local/chalZ/BS_qPVyXoa5akv8rlfdn9Rc38FpJVEuivp0BD0D9vUI",
		"authorizationURL": "https://pebble.pebble.svc.cluster.local/authZ/E-01NwTYd5HPlm6M2r1o52HUl4Qd19-XfucJd2yT0Ew",
		"dnsName": "lexac.ingress-nginx.http01.example.com",
		"wildcard": false,
		"type": "HTTP-01",
		"token": "XtB3cJTMFM5oQfRPi-psqGaUsW-GDW8GYvtE96oEPBU",
		"key": "XtB3cJTMFM5oQfRPi-psqGaUsW-GDW8GYvtE96oEPBU.tXubArjStIF57iuqFmodeh_PrDetazDYAt9AqeNpOGE",
		"solver": {
			"http01": {
				"ingress": {
					"class": "nginx"
				}
			}
		},
		"issuerRef": {
			"name": "test-acme-issuer"
		}
	},
	"status": {
		"processing": false,
		"presented": false
	}
}]
```

The order controller creates set of challenges that needs to be solved for the certificate to be issued

### 4. Challenge service, pods and ingress

#### Pod
```
{
	"metadata": {
		"name": "cm-acme-http-solver-zg24g",
		"generateName": "cm-acme-http-solver-",
		"namespace": "e2e-tests-create-acme-certificate-request-http01-8ft6m",
		"labels": {
			"acme.cert-manager.io/http-domain": "493358697",
			"acme.cert-manager.io/http-token": "1153896079",
			"acme.cert-manager.io/http01-solver": "true"
		},
		"annotations": {
			"sidecar.istio.io/inject": "false"
		},
		"ownerReferences": [{
			"apiVersion": "acme.cert-manager.io/v1",
			"kind": "Challenge",
			"name": "test-acme-certificate-request-359378691-2804696451",
			"uid": "05021e20-cfa1-428c-93d6-76ca605408c5",
			"controller": true,
			"blockOwnerDeletion": true
		}]

	},
	"spec": {
		"volumes": [{
			"name": "kube-api-access-b2g2p",
			"projected": {
				"sources": [{
					"serviceAccountToken": {
						"expirationSeconds": 3607,
						"path": "token"
					}
				}, {
					"configMap": {
						"name": "kube-root-ca.crt",
						"items": [{
							"key": "ca.crt",
							"path": "ca.crt"
						}]
					}
				}, {
					"downwardAPI": {
						"items": [{
							"path": "namespace",
							"fieldRef": {
								"apiVersion": "v1",
								"fieldPath": "metadata.namespace"
							}
						}]
					}
				}],
				"defaultMode": 420
			}
		}],
		"containers": [{
			"name": "acmesolver",
			"image": "cert-manager-acmesolver-amd64:v1.9.0-beta.1-131-gc63c2b3f9b79fb",
			"args": ["--listen-port=8089", "--domain=xcmoa.ingress-nginx.http01.example.com", "--token=nufTXaKqVDCe9wDU4-TzCpU8rHQ6ahqtQUGOfWEUhd4", "--key=nufTXaKqVDCe9wDU4-TzCpU8rHQ6ahqtQUGOfWEUhd4.jpkp1oDCQPpuLba34lxd4qS_8n5zIdqS3pt9Mc_JHHA"],
			"ports": [{
				"name": "http",
				"containerPort": 8089,
				"protocol": "TCP"
			}],
			"resources": {
				"limits": {
					"cpu": "100m",
					"memory": "64Mi"
				},
				"requests": {
					"cpu": "10m",
					"memory": "64Mi"
				}
			},
			"volumeMounts": [{
				"name": "kube-api-access-b2g2p",
				"readOnly": true,
				"mountPath": "/var/run/secrets/kubernetes.io/serviceaccount"
			}],
			"terminationMessagePath": "/dev/termination-log",
			"terminationMessagePolicy": "File",
			"imagePullPolicy": "IfNotPresent",
			"securityContext": {
				"capabilities": {
					"drop": ["ALL"]
				},
				"allowPrivilegeEscalation": false
			}
		}],
		"restartPolicy": "OnFailure",
		"terminationGracePeriodSeconds": 30,
		"dnsPolicy": "ClusterFirst",
		"nodeSelector": {
			"kubernetes.io/os": "linux"
		},
		"serviceAccountName": "default",
		"serviceAccount": "default",
		"securityContext": {
			"runAsNonRoot": true,
			"seccompProfile": {
				"type": "RuntimeDefault"
			}
		},
		"schedulerName": "default-scheduler",
		"tolerations": [{
			"key": "node.kubernetes.io/not-ready",
			"operator": "Exists",
			"effect": "NoExecute",
			"tolerationSeconds": 300
		}, {
			"key": "node.kubernetes.io/unreachable",
			"operator": "Exists",
			"effect": "NoExecute",
			"tolerationSeconds": 300
		}],
		"priority": 0,
		"enableServiceLinks": true,
		"preemptionPolicy": "PreemptLowerPriority"
	},
	"status": {
		"phase": "Pending",
		"qosClass": "Burstable"
	}
}
```

#### Service
```
{
	"metadata": {
		"name": "cm-acme-http-solver-9h7xk",
		"generateName": "cm-acme-http-solver-",
		"namespace": "e2e-tests-create-acme-certificate-request-http01-8ft6m",
		"labels": {
			"acme.cert-manager.io/http-domain": "493358697",
			"acme.cert-manager.io/http-token": "1153896079",
			"acme.cert-manager.io/http01-solver": "true"
		},
		"annotations": {
			"auth.istio.io/8089": "NONE"
		},
		"ownerReferences": [{
			"apiVersion": "acme.cert-manager.io/v1",
			"kind": "Challenge",
			"name": "test-acme-certificate-request-359378691-2804696451",
			"uid": "05021e20-cfa1-428c-93d6-76ca605408c5",
			"controller": true,
			"blockOwnerDeletion": true
		}]
	},
	"spec": {
		"ports": [{
			"name": "http",
			"protocol": "TCP",
			"port": 8089,
			"targetPort": 8089,
			"nodePort": 31397
		}],
		"selector": {
			"acme.cert-manager.io/http-domain": "493358697",
			"acme.cert-manager.io/http-token": "1153896079",
			"acme.cert-manager.io/http01-solver": "true"
		},
		"clusterIP": "10.0.166.12",
		"clusterIPs": ["10.0.166.12"],
		"type": "NodePort",
		"sessionAffinity": "None",
		"externalTrafficPolicy": "Cluster",
		"ipFamilies": ["IPv4"],
		"ipFamilyPolicy": "SingleStack",
		"internalTrafficPolicy": "Cluster"
	},
	"status": {
		"loadBalancer": {}
	}
}
```

#### Ingress

```
{
	"metadata": {
		"name": "cm-acme-http-solver-lj2lc",
		"generateName": "cm-acme-http-solver-",
		"namespace": "e2e-tests-create-acme-certificate-request-http01-8ft6m",
		"creationTimestamp": "2022-09-27T09:16:57Z",
		"labels": {
			"acme.cert-manager.io/http-domain": "493358697",
			"acme.cert-manager.io/http-token": "1153896079",
			"acme.cert-manager.io/http01-solver": "true"
		},
		"annotations": {
			"kubernetes.io/ingress.class": "nginx",
			"nginx.ingress.kubernetes.io/whitelist-source-range": "0.0.0.0/0,::/0"
		},
		"ownerReferences": [{
			"apiVersion": "acme.cert-manager.io/v1",
			"kind": "Challenge",
			"name": "test-acme-certificate-request-359378691-2804696451",
			"uid": "05021e20-cfa1-428c-93d6-76ca605408c5",
			"controller": true,
			"blockOwnerDeletion": true
		}]
	},
	"spec": {
		"rules": [{
			"host": "xcmoa.ingress-nginx.http01.example.com",
			"http": {
				"paths": [{
					"path": "/.well-known/acme-challenge/nufTXaKqVDCe9wDU4-TzCpU8rHQ6ahqtQUGOfWEUhd4",
					"pathType": "ImplementationSpecific",
					"backend": {
						"service": {
							"name": "cm-acme-http-solver-9h7xk",
							"port": {
								"number": 8089
							}
						}
					}
				}]
			}
		}]
	},
	"status": {
		"loadBalancer": {}
	}
}
```