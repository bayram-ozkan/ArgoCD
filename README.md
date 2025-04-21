# ArgoCD Kurulum ve Kullanım Adımları

Bu doküman, Kubernetes kümesinde ArgoCD kurulumu ve temel kullanım adımlarını içermektedir.

## 1. ArgoCD Namespace Oluşturulması

Öncelikle, Kubernetes kümeniz üzerinde ArgoCD'nin çalışacağı bir namespace oluşturmanız gerekmektedir.

```
kubectl create namespace argocd
```

## 2. ArgoCD Kurulumunun Yapılması

```
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

```


* Version kontrol edilebilir.
```
kubectl get deployment argocd-server -n argocd -o=jsonpath='{.spec.template.spec.containers[0].image}' | cut -d':' -f2
```


## 3. ArgoCD Admin Şifresinin Alınması

```
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d && echo

```

> **_NOTE:_**  default username: ```admin```

## 4. ArgoCD Web UI Erişimi

```
kubectl port-forward svc/argocd-server -n argocd 8080:443
```

> **_NOTE:_**  8080 portuna yönlendirdiğimiz için
> http://localhost:8080


## 5. Test Uygulaması Kurulumu

```
kubectl apply -f application.yaml

```


### Kaynaklar

* ArgoCD Resmi GitHub Reposu  : https://github.com/argoproj/argo-cd

* ArgoCD Resmi Dökümantasyonu : https://argo-cd.readthedocs.io/en/stable/getting_started/
