For cluster controlled load balancing I am using [MetalLB](https://metallb.universe.tf)




# [Installation](https://metallb.universe.tf/installation/)

Install by manifest
```shell
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml

# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
```

Currently using the layer 2 configuration. 
```shell
#install metallb
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
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
```
