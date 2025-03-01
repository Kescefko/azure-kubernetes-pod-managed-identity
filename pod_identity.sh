export POD_IDENTITY_NAME="aks-pod-identity"
export POD_IDENTITY_NAMESPACE="test-app"
export IDENTITY_NAME="application-identity-weu"
export IDENTITY_RESOURCE_GROUP="rg-identity-weu"

IDENTITY_RESOURCE_ID=$(az identity show --name ${IDENTITY_NAME} --resource-group ${IDENTITY_RESOURCE_GROUP} --query id --output tsv)

az aks pod-identity add --resource-group rg-aks-dev --cluster-name aks-dev-01 --namespace ${POD_IDENTITY_NAMESPACE}  --name ${POD_IDENTITY_NAME} --identity-resource-id ${IDENTITY_RESOURCE_ID}