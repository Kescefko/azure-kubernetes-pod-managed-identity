#!/bin/bash

# Obtain the name of the resource group containing the Virtual Machine Scale set of your AKS cluster
NODE_GROUP=$(az aks show --resource-group rg-aks-dev --name aks-dev-01 --query nodeResourceGroup -o tsv)

# Debugging output to ensure NODE_GROUP is correct
echo "Node resource group: $NODE_GROUP"

# Obtain the id of the node resource group 
NODES_RESOURCE_ID=$(az group show --name "$NODE_GROUP" -o tsv --query "id")

# Debugging output to ensure NODES_RESOURCE_ID is correct
echo "Node resource group ID: $NODES_RESOURCE_ID"

# Obtain the identity client ID
IDENTITY_NAME="application-identity-weu"
IDENTITY_CLIENT_ID=$(az identity show --resource-group rg-aks-dev --name "${IDENTITY_NAME}" --query clientId -o tsv)

# Debugging output to ensure IDENTITY_CLIENT_ID is correct
echo "Identity Client ID: $IDENTITY_CLIENT_ID"

# Check if IDENTITY_CLIENT_ID is empty
if [ -z "$IDENTITY_CLIENT_ID" ]; then
  echo "Error: Managed Identity Client ID is empty. Please ensure the identity exists and the name is correct."
  exit 1
fi

# Create a role assignment granting your managed identity permissions on the node resource group
az role assignment create --role "Virtual Machine Contributor" --assignee "$IDENTITY_CLIENT_ID" --scope "$NODES_RESOURCE_ID"
