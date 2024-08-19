#Start single apps
k -n argocd apply -f argocd-declarative/argocd-apps/argocd-app.yml
k -n argocd apply -f https://github.com/kube-craft/git-ops/blob/main/argocd-declarative/argocd-apps/argocd-app.yml


#Start all apps
k -n argocd apply -f argocd-declarative/argocd-multi-apps/argocd-multi-apps.yml
k -n argocd apply -f https://github.com/kube-craft/git-ops/blob/main/argocd-declarative/argocd-multi-apps/argocd-multi-apps.yml


k -n argocd get applications