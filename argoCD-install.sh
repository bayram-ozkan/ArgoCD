
kubectl create namespace argocd


# https://argo-cd.readthedocs.io/en/stable/getting_started/
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/v2.1.3/manifests/install.yaml



kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d && echo
    

kubectl port-forward svc/argocd-server -n argocd 8080:443


# http://localhost:8080


# default   username   ```admin```    ve   şifre   

kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo



# Test uygulaması 

kubectl apply -f application.yaml
