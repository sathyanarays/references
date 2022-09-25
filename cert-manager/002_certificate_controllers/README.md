## Initial State

```azure
{
	"metadata": {
		"name": "test-selfsigned-certificate",
		"namespace": "e2e-tests-create-selfsigned-certificate-mxmw9",
		"uid": "d7f081f6-7a4f-408c-9f96-cabf07a15988",
		"resourceVersion": "680190",
		"generation": 1,
		"creationTimestamp": "2022-09-25T08:10:35Z",
		"managedFields": [{
			"manager": "e2e.test",
			"operation": "Update",
			"apiVersion": "cert-manager.io/v1",
			"time": "2022-09-25T08:10:35Z",
			"fieldsType": "FieldsV1",
			"fieldsV1": {
				"f:spec": {
					".": {},
					"f:commonName": {},
					"f:issuerRef": {
						".": {},
						"f:kind": {},
						"f:name": {}
					},
					"f:privateKey": {},
					"f:secretName": {},
					"f:subject": {
						".": {},
						"f:organizations": {}
					}
				}
			}
		}]
	},
	"spec": {
		"subject": {
			"organizations": ["test-org"]
		},
		"commonName": "test.domain.com",
		"secretName": "test-selfsigned-certificate",
		"issuerRef": {
			"name": "test-selfsigned-issuer",
			"kind": "Issuer"
		},
		"privateKey": {}
	},
	"status": {}
}
```

## State 1

```azure
{
	"metadata": {
		"name": "test-selfsigned-certificate",
		"namespace": "e2e-tests-create-selfsigned-certificate-mxmw9",
		"uid": "d7f081f6-7a4f-408c-9f96-cabf07a15988",
		"resourceVersion": "680191",
		"generation": 1,
		"creationTimestamp": "2022-09-25T08:10:35Z",
		"managedFields": [{
			"manager": "cert-manager-certificates-readiness",
			"operation": "Apply",
			"apiVersion": "cert-manager.io/v1",
			"time": "2022-09-25T08:10:35Z",
			"fieldsType": "FieldsV1",
			"fieldsV1": {
				"f:status": {
					"f:conditions": {
						"k:{\"type\":\"Ready\"}": {
							".": {},
							"f:lastTransitionTime": {},
							"f:message": {},
							"f:observedGeneration": {},
							"f:reason": {},
							"f:status": {},
							"f:type": {}
						}
					}
				}
			},
			"subresource": "status"
		}, {
			"manager": "e2e.test",
			"operation": "Update",
			"apiVersion": "cert-manager.io/v1",
			"time": "2022-09-25T08:10:35Z",
			"fieldsType": "FieldsV1",
			"fieldsV1": {
				"f:spec": {
					".": {},
					"f:commonName": {},
					"f:issuerRef": {
						".": {},
						"f:kind": {},
						"f:name": {}
					},
					"f:privateKey": {},
					"f:secretName": {},
					"f:subject": {
						".": {},
						"f:organizations": {}
					}
				}
			}
		}]
	},
	"spec": {
		"subject": {
			"organizations": ["test-org"]
		},
		"commonName": "test.domain.com",
		"secretName": "test-selfsigned-certificate",
		"issuerRef": {
			"name": "test-selfsigned-issuer",
			"kind": "Issuer"
		},
		"privateKey": {}
	},
	"status": {
		"conditions": [{
			"type": "Ready",
			"status": "False",
			"lastTransitionTime": "2022-09-25T08:10:35Z",
			"reason": "DoesNotExist",
			"message": "Issuing certificate as Secret does not exist",
			"observedGeneration": 1
		}]
	}
}
```

## State 2

```azure
{
	"metadata": {
		"name": "test-selfsigned-certificate",
		"namespace": "e2e-tests-create-selfsigned-certificate-mxmw9",
		"uid": "d7f081f6-7a4f-408c-9f96-cabf07a15988",
		"resourceVersion": "680192",
		"generation": 1,
		"creationTimestamp": "2022-09-25T08:10:35Z",
		"managedFields": [{
			"manager": "cert-manager-certificates-readiness",
			"operation": "Apply",
			"apiVersion": "cert-manager.io/v1",
			"time": "2022-09-25T08:10:35Z",
			"fieldsType": "FieldsV1",
			"fieldsV1": {
				"f:status": {
					"f:conditions": {
						"k:{\"type\":\"Ready\"}": {
							".": {},
							"f:lastTransitionTime": {},
							"f:message": {},
							"f:observedGeneration": {},
							"f:reason": {},
							"f:status": {},
							"f:type": {}
						}
					}
				}
			},
			"subresource": "status"
		}, {
			"manager": "cert-manager-certificates-trigger",
			"operation": "Apply",
			"apiVersion": "cert-manager.io/v1",
			"time": "2022-09-25T08:10:35Z",
			"fieldsType": "FieldsV1",
			"fieldsV1": {
				"f:status": {
					"f:conditions": {
						"k:{\"type\":\"Issuing\"}": {
							".": {},
							"f:lastTransitionTime": {},
							"f:message": {},
							"f:observedGeneration": {},
							"f:reason": {},
							"f:status": {},
							"f:type": {}
						}
					}
				}
			},
			"subresource": "status"
		}, {
			"manager": "e2e.test",
			"operation": "Update",
			"apiVersion": "cert-manager.io/v1",
			"time": "2022-09-25T08:10:35Z",
			"fieldsType": "FieldsV1",
			"fieldsV1": {
				"f:spec": {
					".": {},
					"f:commonName": {},
					"f:issuerRef": {
						".": {},
						"f:kind": {},
						"f:name": {}
					},
					"f:privateKey": {},
					"f:secretName": {},
					"f:subject": {
						".": {},
						"f:organizations": {}
					}
				}
			}
		}]
	},
	"spec": {
		"subject": {
			"organizations": ["test-org"]
		},
		"commonName": "test.domain.com",
		"secretName": "test-selfsigned-certificate",
		"issuerRef": {
			"name": "test-selfsigned-issuer",
			"kind": "Issuer"
		},
		"privateKey": {}
	},
	"status": {
		"conditions": [{
			"type": "Ready",
			"status": "False",
			"lastTransitionTime": "2022-09-25T08:10:35Z",
			"reason": "DoesNotExist",
			"message": "Issuing certificate as Secret does not exist",
			"observedGeneration": 1
		}, {
			"type": "Issuing",
			"status": "True",
			"lastTransitionTime": "2022-09-25T08:10:35Z",
			"reason": "DoesNotExist",
			"message": "Issuing certificate as Secret does not exist",
			"observedGeneration": 1
		}]
	}
}
```

## State 3

```azure
{
	"metadata": {
		"name": "test-selfsigned-certificate",
		"namespace": "e2e-tests-create-selfsigned-certificate-mxmw9",
		"uid": "d7f081f6-7a4f-408c-9f96-cabf07a15988",
		"resourceVersion": "680197",
		"generation": 1,
		"creationTimestamp": "2022-09-25T08:10:35Z",
		"managedFields": [{
			"manager": "cert-manager-certificates-readiness",
			"operation": "Apply",
			"apiVersion": "cert-manager.io/v1",
			"time": "2022-09-25T08:10:35Z",
			"fieldsType": "FieldsV1",
			"fieldsV1": {
				"f:status": {
					"f:conditions": {
						"k:{\"type\":\"Ready\"}": {
							".": {},
							"f:lastTransitionTime": {},
							"f:message": {},
							"f:observedGeneration": {},
							"f:reason": {},
							"f:status": {},
							"f:type": {}
						}
					}
				}
			},
			"subresource": "status"
		}, {
			"manager": "cert-manager-certificates-trigger",
			"operation": "Apply",
			"apiVersion": "cert-manager.io/v1",
			"time": "2022-09-25T08:10:35Z",
			"fieldsType": "FieldsV1",
			"fieldsV1": {
				"f:status": {
					"f:conditions": {
						"k:{\"type\":\"Issuing\"}": {
							".": {},
							"f:lastTransitionTime": {},
							"f:message": {},
							"f:observedGeneration": {},
							"f:reason": {},
							"f:status": {},
							"f:type": {}
						}
					}
				}
			},
			"subresource": "status"
		}, {
			"manager": "cert-manager-certificates-key-manager",
			"operation": "Apply",
			"apiVersion": "cert-manager.io/v1",
			"time": "2022-09-25T08:10:36Z",
			"fieldsType": "FieldsV1",
			"fieldsV1": {
				"f:status": {
					"f:nextPrivateKeySecretName": {}
				}
			},
			"subresource": "status"
		}, {
			"manager": "e2e.test",
			"operation": "Update",
			"apiVersion": "cert-manager.io/v1",
			"time": "2022-09-25T08:10:35Z",
			"fieldsType": "FieldsV1",
			"fieldsV1": {
				"f:spec": {
					".": {},
					"f:commonName": {},
					"f:issuerRef": {
						".": {},
						"f:kind": {},
						"f:name": {}
					},
					"f:privateKey": {},
					"f:secretName": {},
					"f:subject": {
						".": {},
						"f:organizations": {}
					}
				}
			}
		}]
	},
	"spec": {
		"subject": {
			"organizations": ["test-org"]
		},
		"commonName": "test.domain.com",
		"secretName": "test-selfsigned-certificate",
		"issuerRef": {
			"name": "test-selfsigned-issuer",
			"kind": "Issuer"
		},
		"privateKey": {}
	},
	"status": {
		"conditions": [{
			"type": "Ready",
			"status": "False",
			"lastTransitionTime": "2022-09-25T08:10:35Z",
			"reason": "DoesNotExist",
			"message": "Issuing certificate as Secret does not exist",
			"observedGeneration": 1
		}, {
			"type": "Issuing",
			"status": "True",
			"lastTransitionTime": "2022-09-25T08:10:35Z",
			"reason": "DoesNotExist",
			"message": "Issuing certificate as Secret does not exist",
			"observedGeneration": 1
		}],
		"nextPrivateKeySecretName": "test-selfsigned-certificate-5pxp9"
	}
}
```

## State 4
```azure
{
	"metadata": {
		"name": "test-selfsigned-certificate",
		"namespace": "e2e-tests-create-selfsigned-certificate-mxmw9",
		"uid": "d7f081f6-7a4f-408c-9f96-cabf07a15988",
		"resourceVersion": "680206",
		"generation": 1,
		"creationTimestamp": "2022-09-25T08:10:35Z",
		"managedFields": [{
			"manager": "cert-manager-certificates-readiness",
			"operation": "Apply",
			"apiVersion": "cert-manager.io/v1",
			"time": "2022-09-25T08:10:35Z",
			"fieldsType": "FieldsV1",
			"fieldsV1": {
				"f:status": {
					"f:conditions": {
						"k:{\"type\":\"Ready\"}": {
							".": {},
							"f:lastTransitionTime": {},
							"f:message": {},
							"f:observedGeneration": {},
							"f:reason": {},
							"f:status": {},
							"f:type": {}
						}
					}
				}
			},
			"subresource": "status"
		}, {
			"manager": "cert-manager-certificates-trigger",
			"operation": "Apply",
			"apiVersion": "cert-manager.io/v1",
			"time": "2022-09-25T08:10:35Z",
			"fieldsType": "FieldsV1",
			"fieldsV1": {
				"f:status": {
					"f:conditions": {
						"k:{\"type\":\"Issuing\"}": {
							".": {},
							"f:observedGeneration": {},
							"f:type": {}
						}
					}
				}
			},
			"subresource": "status"
		}, {
			"manager": "cert-manager-certificates-issuing",
			"operation": "Apply",
			"apiVersion": "cert-manager.io/v1",
			"time": "2022-09-25T08:10:36Z",
			"fieldsType": "FieldsV1",
			"fieldsV1": {
				"f:status": {
					"f:conditions": {
						"k:{\"type\":\"Issuing\"}": {
							".": {},
							"f:lastTransitionTime": {},
							"f:message": {},
							"f:observedGeneration": {},
							"f:reason": {},
							"f:status": {},
							"f:type": {}
						}
					},
					"f:revision": {}
				}
			},
			"subresource": "status"
		}, {
			"manager": "cert-manager-certificates-key-manager",
			"operation": "Apply",
			"apiVersion": "cert-manager.io/v1",
			"time": "2022-09-25T08:10:36Z",
			"fieldsType": "FieldsV1",
			"fieldsV1": {
				"f:status": {
					"f:nextPrivateKeySecretName": {}
				}
			},
			"subresource": "status"
		}, {
			"manager": "e2e.test",
			"operation": "Update",
			"apiVersion": "cert-manager.io/v1",
			"time": "2022-09-25T08:10:35Z",
			"fieldsType": "FieldsV1",
			"fieldsV1": {
				"f:spec": {
					".": {},
					"f:commonName": {},
					"f:issuerRef": {
						".": {},
						"f:kind": {},
						"f:name": {}
					},
					"f:privateKey": {},
					"f:secretName": {},
					"f:subject": {
						".": {},
						"f:organizations": {}
					}
				}
			}
		}]
	},
	"spec": {
		"subject": {
			"organizations": ["test-org"]
		},
		"commonName": "test.domain.com",
		"secretName": "test-selfsigned-certificate",
		"issuerRef": {
			"name": "test-selfsigned-issuer",
			"kind": "Issuer"
		},
		"privateKey": {}
	},
	"status": {
		"conditions": [{
			"type": "Ready",
			"status": "False",
			"lastTransitionTime": "2022-09-25T08:10:35Z",
			"reason": "DoesNotExist",
			"message": "Issuing certificate as Secret does not exist",
			"observedGeneration": 1
		}, {
			"type": "Issuing",
			"status": "False",
			"lastTransitionTime": "2022-09-25T08:10:36Z",
			"reason": "Issued",
			"message": "The certificate has been successfully issued",
			"observedGeneration": 1
		}],
		"revision": 1,
		"nextPrivateKeySecretName": "test-selfsigned-certificate-5pxp9"
	}
}
```

## State 5
```azure
{
	"metadata": {
		"name": "test-selfsigned-certificate",
		"namespace": "e2e-tests-create-selfsigned-certificate-mxmw9",
		"uid": "d7f081f6-7a4f-408c-9f96-cabf07a15988",
		"resourceVersion": "680209",
		"generation": 1,
		"creationTimestamp": "2022-09-25T08:10:35Z",
		"managedFields": [{
			"manager": "cert-manager-certificates-trigger",
			"operation": "Apply",
			"apiVersion": "cert-manager.io/v1",
			"time": "2022-09-25T08:10:35Z",
			"fieldsType": "FieldsV1",
			"fieldsV1": {
				"f:status": {
					"f:conditions": {
						"k:{\"type\":\"Issuing\"}": {
							".": {},
							"f:observedGeneration": {},
							"f:type": {}
						}
					}
				}
			},
			"subresource": "status"
		}, {
			"manager": "cert-manager-certificates-issuing",
			"operation": "Apply",
			"apiVersion": "cert-manager.io/v1",
			"time": "2022-09-25T08:10:36Z",
			"fieldsType": "FieldsV1",
			"fieldsV1": {
				"f:status": {
					"f:conditions": {
						"k:{\"type\":\"Issuing\"}": {
							".": {},
							"f:lastTransitionTime": {},
							"f:message": {},
							"f:observedGeneration": {},
							"f:reason": {},
							"f:status": {},
							"f:type": {}
						}
					},
					"f:revision": {}
				}
			},
			"subresource": "status"
		}, {
			"manager": "cert-manager-certificates-key-manager",
			"operation": "Apply",
			"apiVersion": "cert-manager.io/v1",
			"time": "2022-09-25T08:10:36Z",
			"fieldsType": "FieldsV1",
			"fieldsV1": {
				"f:status": {
					"f:nextPrivateKeySecretName": {}
				}
			},
			"subresource": "status"
		}, {
			"manager": "cert-manager-certificates-readiness",
			"operation": "Apply",
			"apiVersion": "cert-manager.io/v1",
			"time": "2022-09-25T08:10:36Z",
			"fieldsType": "FieldsV1",
			"fieldsV1": {
				"f:status": {
					"f:conditions": {
						"k:{\"type\":\"Ready\"}": {
							".": {},
							"f:lastTransitionTime": {},
							"f:message": {},
							"f:observedGeneration": {},
							"f:reason": {},
							"f:status": {},
							"f:type": {}
						}
					},
					"f:notAfter": {},
					"f:notBefore": {},
					"f:renewalTime": {}
				}
			},
			"subresource": "status"
		}, {
			"manager": "e2e.test",
			"operation": "Update",
			"apiVersion": "cert-manager.io/v1",
			"time": "2022-09-25T08:10:35Z",
			"fieldsType": "FieldsV1",
			"fieldsV1": {
				"f:spec": {
					".": {},
					"f:commonName": {},
					"f:issuerRef": {
						".": {},
						"f:kind": {},
						"f:name": {}
					},
					"f:privateKey": {},
					"f:secretName": {},
					"f:subject": {
						".": {},
						"f:organizations": {}
					}
				}
			}
		}]
	},
	"spec": {
		"subject": {
			"organizations": ["test-org"]
		},
		"commonName": "test.domain.com",
		"secretName": "test-selfsigned-certificate",
		"issuerRef": {
			"name": "test-selfsigned-issuer",
			"kind": "Issuer"
		},
		"privateKey": {}
	},
	"status": {
		"conditions": [{
			"type": "Ready",
			"status": "True",
			"lastTransitionTime": "2022-09-25T08:10:36Z",
			"reason": "Ready",
			"message": "Certificate is up to date and has not expired",
			"observedGeneration": 1
		}, {
			"type": "Issuing",
			"status": "False",
			"lastTransitionTime": "2022-09-25T08:10:36Z",
			"reason": "Issued",
			"message": "The certificate has been successfully issued",
			"observedGeneration": 1
		}],
		"notBefore": "2022-09-25T08:10:36Z",
		"notAfter": "2022-12-24T08:10:36Z",
		"renewalTime": "2022-11-24T08:10:36Z",
		"revision": 1,
		"nextPrivateKeySecretName": "test-selfsigned-certificate-5pxp9"
	}
}
```

## State 6

```azure
{
	"metadata": {
		"name": "test-selfsigned-certificate",
		"namespace": "e2e-tests-create-selfsigned-certificate-mxmw9",
		"uid": "d7f081f6-7a4f-408c-9f96-cabf07a15988",
		"resourceVersion": "680210",
		"generation": 1,
		"creationTimestamp": "2022-09-25T08:10:35Z",
		"managedFields": [{
			"manager": "cert-manager-certificates-trigger",
			"operation": "Apply",
			"apiVersion": "cert-manager.io/v1",
			"time": "2022-09-25T08:10:35Z",
			"fieldsType": "FieldsV1",
			"fieldsV1": {
				"f:status": {
					"f:conditions": {
						"k:{\"type\":\"Issuing\"}": {
							".": {},
							"f:observedGeneration": {},
							"f:type": {}
						}
					}
				}
			},
			"subresource": "status"
		}, {
			"manager": "cert-manager-certificates-issuing",
			"operation": "Apply",
			"apiVersion": "cert-manager.io/v1",
			"time": "2022-09-25T08:10:36Z",
			"fieldsType": "FieldsV1",
			"fieldsV1": {
				"f:status": {
					"f:conditions": {
						"k:{\"type\":\"Issuing\"}": {
							".": {},
							"f:lastTransitionTime": {},
							"f:message": {},
							"f:observedGeneration": {},
							"f:reason": {},
							"f:status": {},
							"f:type": {}
						}
					},
					"f:revision": {}
				}
			},
			"subresource": "status"
		}, {
			"manager": "cert-manager-certificates-key-manager",
			"operation": "Apply",
			"apiVersion": "cert-manager.io/v1",
			"time": "2022-09-25T08:10:36Z",
			"fieldsType": "FieldsV1",
			"fieldsV1": {
				"f:status": {}
			},
			"subresource": "status"
		}, {
			"manager": "cert-manager-certificates-readiness",
			"operation": "Apply",
			"apiVersion": "cert-manager.io/v1",
			"time": "2022-09-25T08:10:36Z",
			"fieldsType": "FieldsV1",
			"fieldsV1": {
				"f:status": {
					"f:conditions": {
						"k:{\"type\":\"Ready\"}": {
							".": {},
							"f:lastTransitionTime": {},
							"f:message": {},
							"f:observedGeneration": {},
							"f:reason": {},
							"f:status": {},
							"f:type": {}
						}
					},
					"f:notAfter": {},
					"f:notBefore": {},
					"f:renewalTime": {}
				}
			},
			"subresource": "status"
		}, {
			"manager": "e2e.test",
			"operation": "Update",
			"apiVersion": "cert-manager.io/v1",
			"time": "2022-09-25T08:10:35Z",
			"fieldsType": "FieldsV1",
			"fieldsV1": {
				"f:spec": {
					".": {},
					"f:commonName": {},
					"f:issuerRef": {
						".": {},
						"f:kind": {},
						"f:name": {}
					},
					"f:privateKey": {},
					"f:secretName": {},
					"f:subject": {
						".": {},
						"f:organizations": {}
					}
				}
			}
		}]
	},
	"spec": {
		"subject": {
			"organizations": ["test-org"]
		},
		"commonName": "test.domain.com",
		"secretName": "test-selfsigned-certificate",
		"issuerRef": {
			"name": "test-selfsigned-issuer",
			"kind": "Issuer"
		},
		"privateKey": {}
	},
	"status": {
		"conditions": [{
			"type": "Ready",
			"status": "True",
			"lastTransitionTime": "2022-09-25T08:10:36Z",
			"reason": "Ready",
			"message": "Certificate is up to date and has not expired",
			"observedGeneration": 1
		}, {
			"type": "Issuing",
			"status": "False",
			"lastTransitionTime": "2022-09-25T08:10:36Z",
			"reason": "Issued",
			"message": "The certificate has been successfully issued",
			"observedGeneration": 1
		}],
		"notBefore": "2022-09-25T08:10:36Z",
		"notAfter": "2022-12-24T08:10:36Z",
		"renewalTime": "2022-11-24T08:10:36Z",
		"revision": 1
	}
}
```