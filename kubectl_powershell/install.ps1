# Download the latest stable release of kubectl
Invoke-WebRequest -Uri https://storage.googleapis.com/kubernetes-release/release/$(Invoke-RestMethod -Uri https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/windows/amd64/kubectl.exe -OutFile kubectl.exe

# Add kubectl to PATH (optional)
Move-Item kubectl.exe "C:\Windows\System32"

# Verify the installation
kubectl version --client
