# Self signed certificates

## Create namespace

`kubectl create ns cert-manager-test`

## Create Issuer

`kubectl apply -f issuer.yaml`

## Create Certificate

`kubectl apply -f certificate.yaml`

## Validations

### Secret generated

The self-signed certificate should create a secret `selfsigned-certificate` on success.

### Secret has required keys

The secret should contain the following fields:
- ca.crt
- tls.crt
- tls.key

### Convert the certificate to human-readable format

` kubectl get secrets selfsigned-certificate -n cert-manager-test -o yaml | yq '.data."tls.crt"' | base64 -d | openssl x509 -noout -text`

### Validate the organization

Verify that the subject of the certificate has the organization set as expected. In our case, the organization name should be `test-org`.

This can be validating the text `Subject: O=test-org` in the human-readable format.

### Validate CA certificate and TLS certificate

The keys `ca.crt` and `tls.crt` should be equal in the secret generated.

### Validate the Key, Certificate pair

Run the script `verify.sh` to check if the generated certificate is valid with respect to the private key.


