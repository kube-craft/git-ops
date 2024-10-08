# prerequisites for new cluster
k apply -f https://raw.githubusercontent.com/kube-craft/git-ops/main/argocd-declarative/manifests/ingress-app/baremetal-deploy.yml

#Start single apps
# Install Argo
k create namespace argocd
k -n argocd apply -f https://raw.githubusercontent.com/kube-craft/git-ops/main/argocd-declarative/manifests/argocd-app/argocd-install.yml

# Add repo
k -n argocd apply -f https://raw.githubusercontent.com/kube-craft/git-ops/main/argocd-declarative/manifests/argocd-app/public-github-repo.yml
k -n argocd apply -f https://raw.githubusercontent.com/kube-craft/git-ops/main/argocd-declarative/manifests/argocd-app/private-gitea-repo.yml

# Add Projects and Applications
k -n argocd apply -f https://raw.githubusercontent.com/kube-craft/git-ops/main/argocd-declarative/manifests/argocd-app/projects/infrastructure.yml

#argocd
k -n argocd apply -f argocd-declarative/argocd-apps/argocd-app.yml
k -n argocd apply -f https://raw.githubusercontent.com/kube-craft/git-ops/main/argocd-declarative/argocd-apps/argocd-app.yml

k -n argocd get applications

#get initial password
k -n argocd get secrets argocd-initial-admin-secret -o json | jq .data.password -r | tr -d '\n'  | base64 -d





#geocentric
k -n argocd apply -f argocd-declarative/argocd-apps/geocentric-app.yml
k -n argocd apply -f https://raw.githubusercontent.com/kube-craft/git-ops/main/argocd-declarative/argocd-apps/geocentric-app.yml

#gitea
k -n argocd apply -f argocd-declarative/argocd-apps/gitea-app.yml
k -n argocd apply -f https://raw.githubusercontent.com/kube-craft/git-ops/main/argocd-declarative/argocd-apps/gitea-app.yml


#Start all apps (self heal is off and manual sync is enabled)
k -n argocd apply -f argocd-declarative/argocd-multi-apps/argocd-multi-apps.yml
k -n argocd apply -f https://raw.githubusercontent.com/kube-craft/git-ops/main/argocd-declarative/argocd-multi-apps/argocd-multi-apps.yml