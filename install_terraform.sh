#!/bin/bash
set -e

echo "🚀 Starting Terraform installation..."

# Step 1: Update system and install dependencies
echo "📦 Updating system and installing dependencies..."
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common wget

# Step 2: Add HashiCorp GPG key
echo "🔑 Adding HashiCorp GPG key..."
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null

# Step 3: Verify GPG key fingerprint
echo "🧩 Verifying GPG key fingerprint..."
gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint

# Step 4: Add HashiCorp official repository
echo "📁 Adding HashiCorp repository..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list

# Step 5: Update apt and install Terraform
echo "⬇️ Installing Terraform..."
sudo apt update
sudo apt-get install -y terraform

# Step 6: Verify installation
echo "✅ Checking Terraform version..."
terraform -version

echo "🎉 Terraform installation completed successfully!"
