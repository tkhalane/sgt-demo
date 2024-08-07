
#1
helm repo add crossplane-stable https://charts.crossplane.io/stable && helm repo update
#2
helm install crossplane crossplane-stable/crossplane --namespace crossplane-system --create-namespace
#3
kubectl get pods -n crossplane-system
#4
kubectl api-resources  | grep crossplane
kubectl get crds


### FOR AZURE ###
kubectl apply -f platform/control-plane/azure/azure-providers.yml 

kubectl get providers

# create service principal, and store output in azure-credentials.json
az login
az ad sp create-for-rbac \
--sdk-auth \
--role Owner \
--scopes /subscriptions/85933884-f6aa-4035-a09c-03e9776d31cd


# create k8s secret

kubectl create secret generic azure-secret -n crossplane-system --from-file=creds=./azure-credentials.json

kubectl describe secret azure-secret -n crossplane-system

kubectl apply -f platform/control-plane/azure/provider-config.yml

kubectl describe linuxvirtualmachine | grep "At Provider\|Location"


kubectl get xrd  
kubectl get composition
kubectl get claim -n sgt-apps  
kubectl get composite                                  

# troublshoot

# check resources

kubectl get managed  

kubectl describe rediscache.cache.azure.upbound.io/example-secondary
kubectl api-resources | grep sgt 
# Unable to create application: application spec for testcross is invalid: InvalidSpecError: Unable to get cluster:


# rpc error: code = NotFound desc = cluster "controlplane-dns-rch2tfg7.hcp.swedencentral.azmk8s.io" not found

kubectl get composite
kubectl describe  table.dynamodb.aws.upbound.io/sgt-wealthbonus-qdj7b-nds8s
kubectl get managed  
kubectl api-resources
 kubectl get claim -n sgt-apps

kubectl logs ingress-nginx-controller-86b55bb769-qb258 -n ingress-nginx
#or
kubectl exec -it ingress-nginx-controller-86b55bb769-qb258 -n ingress-nginx -- /bin/sh
cd /etc/nginx/
cat nginx.conf


kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
# password = 76ebwkMLjhcihGiX replaced with Password01#
#In order to access the server UI you have the flowing options:
# nc-kJC1qpSSJ1o1R
#1. 
kubectl port-forward service/argocd-server -n argocd 8080:443