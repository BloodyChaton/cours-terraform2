kubectl run web --image=gcr.io/google-samples/hello-app:1.0 --port=8080 -n ingress-nginx
kubectl expose deployment web --target-port=8080 --type=NodePort -n ingress-nginx
kubectl get service web -n ingress-nginx
# https://kubernetes.io/docs/tasks/access-application-cluster/ingress-minikube/

