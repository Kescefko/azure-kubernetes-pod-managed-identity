# set up

# extend az cli
az extension add --name aks-preview
az extension update --name aks-preview

# register feature and provider
az feature register --namespace "Microsoft.ContainerService" --name "EnablePodIdentityPreview"
az feature show --namespace "Microsoft.ContainerService" --name "EnablePodIdentityPreview"
az provider register --namespace Microsoft.ContainerService