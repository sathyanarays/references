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
