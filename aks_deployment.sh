az group create --name rg-aks-dev --location westeurope

az aks create \
    --resource-group rg-aks-dev \
    --name aks-dev-01 \
    --enable-pod-identity \
    --network-plugin azure \
    --generate-ssh-keys

# credentials
# az aks get-credentials --resource-group rg-aks-dev --name aks-dev-01