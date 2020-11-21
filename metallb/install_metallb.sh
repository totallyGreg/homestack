#install metallb
kubectl apply -f https://raw.githubusercontent.com/google/metallb/v0.9.3/manifests/metallb.yaml

kubectl get pods -n metallb-system

cat <<'_EOF_'> metallb-config.yaml
apiVersion: v1
kind: ConfigMap
metadata:
  namespace: metallb-system
  name: config
data:
  config: |
    address-pools:
    - name: default
      protocol: layer2
      addresses:
      - 10.0.1.224-10.0.1.250
_EOF_
kubectl apply -f metallb-config.yaml
