#Start single apps
# Install Argo
k create namespace argocd
k -n argocd apply -f https://raw.githubusercontent.com/kube-craft/git-ops/main/argocd-declarative/manifests/argocd-app/argocd-install.yml

# Add repo
k -n argocd apply -f https://raw.githubusercontent.com/kube-craft/git-ops/main/argocd-declarative/manifests/argocd-app/public-github-repo.yml
k -n argocd apply -f https://raw.githubusercontent.com/kube-craft/git-ops/main/argocd-declarative/manifests/argocd-app/private-gitea-repo.yml

# Add Projects
#geocentric
k -n argocd apply -f argocd-declarative/argocd-apps/geocentric-app.yml
k -n argocd apply -f https://raw.githubusercontent.com/kube-craft/git-ops/main/argocd-declarative/argocd-apps/geocentric-app.yml

#argocd
k -n argocd apply -f argocd-declarative/argocd-apps/argocd-app.yml
k -n argocd apply -f https://raw.githubusercontent.com/kube-craft/git-ops/main/argocd-declarative/argocd-apps/argocd-app.yml




#Start all apps
k -n argocd apply -f argocd-declarative/argocd-multi-apps/argocd-multi-apps.yml
k -n argocd apply -f https://raw.githubusercontent.com/kube-craft/git-ops/main/argocd-declarative/argocd-multi-apps/argocd-multi-apps.yml


k -n argocd get applications