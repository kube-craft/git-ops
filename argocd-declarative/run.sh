#Start single apps
#geocentric
k -n argocd apply -f argocd-declarative/argocd-apps/geocentric-app.yml
k -n argocd apply -f https://raw.githubusercontent.com/kube-craft/git-ops/main/argocd-declarative/argocd-apps/geocentric-app.yml

#argocd
k -n argocd apply -f argocd-declarative/argocd-apps/argo-app.yml
k -n argocd apply -f https://raw.githubusercontent.com/kube-craft/git-ops/main/argocd-declarative/argocd-apps/argo-app.yml




#Start all apps
k -n argocd apply -f argocd-declarative/argocd-multi-apps/argocd-multi-apps.yml
k -n argocd apply -f https://raw.githubusercontent.com/kube-craft/git-ops/main/argocd-declarative/argocd-multi-apps/argocd-multi-apps.yml


k -n argocd get applications