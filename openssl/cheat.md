### 1. Create RSA private key
`openssl genrsa -out key.pem 2048`

### 2. Extract public key from RSA Private Key
`openssl rsa -in key.pem -outform PEM -pubout -out public.pem`

### 3. Generate CSR from RSA Private Key
`openssl req -new -key key.pem -out key.csr`

### 4. Create Self-signed cert with private key and CSR
`openssl x509 -signkey key.pem -in key.csr -req -days 365 -out public.crt`

### 5. Extracting public key from certificate
`openssl x509 -pubkey -noout -in public.crt`

### 6. Creating own root CA
Commands 1 to 4 can be used to create root CA. The `key.pem` with be the root CA key. The `public.crt` will be the root CA certificate.

### 7. Root CA signed certificate
As mentioned in 6, create root CA key with name `rootCAKey.pem` and root CA cert with name `rootCACert.pem`

Follow step 1 and 3 to create a private key and CSR respectively.

`openssl x509 -req -CA rootCACert.pem -CAkey rootCAKey.pem -in key.csr -out cert.pem -days 365 -CAcreateserial`

### 8. Display contents of a certificate
`openssl x509 -in certificate.crt -text -noout`

### 9. Verify if cert is issued by CA
`openssl verify -verbose -CAfile rootCACert.pem cert.pem`

If there are intermediate CAs, a certificate bundle needs to be passed instead of `rootCACert.pem`

Creating CA Cert bundle
`cat rootCACert.pem intermediateCACert.pem > cacert_bundle.pem`

Verify
`openssl verify -verbose -CAfile cacert_bundle.pem cert.pem`



