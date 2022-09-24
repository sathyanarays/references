mkdir tmp

kubectl get secrets selfsigned-certificate -n cert-manager-test -o yaml | yq '.data."tls.crt"' | base64 -d > tmp/tls.crt
kubectl get secrets selfsigned-certificate -n cert-manager-test -o yaml | yq '.data."tls.key"' | base64 -d > tmp/tls.key


CERT_MOD=$(openssl x509 -noout -modulus -in tmp/tls.crt | openssl md5)
KEY_MOD=$(openssl rsa -noout -modulus -in tmp/tls.key | openssl md5)

if [ "$CERT_MOD" = "$KEY_MOD" ]; then
    echo "Valid key, certificate pair"
else
    echo "Invalid key, certificate pair"
fi

rm -rf tmp