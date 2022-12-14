## Readiness Controller
Readiness controller is responsible for managing the following fields in the status:
- Condition of type 'Ready'
- notAfter, notBefore and RenewalTime

### Scenarios
#### Ready condition is not set
When the certificate resource is created, the status will be empty and the conditions will not be present. If the condition of type `Ready` is not present, it is the responsibility of the readiness controller to create the condition of type `Ready` and set it to false.

#### Ready is set to false and the certificates are populated
After some processing, the certificates get generated and they get populated in the secret mentioned by the user. After this, if the `Ready` condition is set to `false`, the readiness controller will take care of setting the `Ready` condition to `true`. Also, the readiness controller populates the fields `notAfter`, `notBefore` and `renewalTime`.

#### Ready is set to true and secret got deleted
If the secret gets deleted, the `Ready` state will be transitioned from `true` to false. Also, the `notAfter`, `notBefore` and `renewalTime` fields will be unset.

## Trigger Controller
The only responsibility of the trigger controller is to set the `Issuing` field to `true`

### Scenarios
#### The secret is not present
When the secret mentioned by the user is not present, the trigger controller sets the `Issuing` condition to `true`.

## Key Manager controller
This controller is responsible for managing the `nextPrivateKey` field in the `status` and the `nextPrivateKey` secret.

### Scenarios

#### Issuing condition is set to false
The controller removes the `nextPrivateKey` secret and the `nextPrivateKeySecret` field in the certificate resource.

#### Issuing condition is set to true
The controller adds the `nextPrivateKey` secret and populates the secret with a new private key. It also updates the certificate resource by adding the `nextPrivateKeySecretName`.

## Issuing controller
The issuing controller is responsible for the following fields:
- revision
- Issuing condition

### Scenarios

#### Issuing condition is set to true
It increments the revision by 1

#### Issuing condition is true and issuing fails
The `Issuing` condition is set to `false`

#### Issuing is set to true and Certificate Request succeeds
This controller is responsible for copying the generated certificates to the secrets. Also, the `Issuing` condition is set to `false` with reason `Issued`.

## Certificate Request Controller
The certificate request controller is responsible for creating the Certificate Request object for the certificate. This happens when the `Issuing` condition is set to `true` and the `nextPrivateKeySecret` is populated with the private key.