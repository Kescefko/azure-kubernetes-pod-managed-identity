az group create --name rg-identity-weu --location westeurope
export IDENTITY_RESOURCE_GROUP="rg-identity-weu"
export IDENTITY_NAME="application-identity-weu"
az identity create --resource-group ${IDENTITY_RESOURCE_GROUP} --name ${IDENTITY_NAME}
export IDENTITY_CLIENT_ID="$(az identity show --resource-group ${IDENTITY_RESOURCE_GROUP} --name ${IDENTITY_NAME} --query clientId -o tsv)"
export IDENTITY_RESOURCE_ID="$(az identity show --resource-group ${IDENTITY_RESOURCE_GROUP} --name ${IDENTITY_NAME} --query id -o tsv)"