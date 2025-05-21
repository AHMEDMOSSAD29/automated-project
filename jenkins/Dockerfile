# Use the official Jenkins LTS image as base
FROM jenkins/jenkins:lts-jdk17

# Switch to root to install dependencies
USER root

# Install basic dependencies
RUN apt-get update && \
    apt-get install -y \
    wget \
    unzip \
    curl \
    jq \
    && rm -rf /var/lib/apt/lists/*

# Install Terraform (more reliable method)
RUN TERRAFORM_VERSION=$(curl -s https://checkpoint-api.hashicorp.com/v1/check/terraform | jq -r .current_version) && \
    wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin && \
    rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    chmod +x /usr/local/bin/terraform

# Verify installation
RUN terraform version

# Switch back to jenkins user
USER jenkins

# Install recommended Jenkins plugins (optional)
RUN jenkins-plugin-cli --plugins \
    pipeline-aws:1.43 \
    terraform:1.0.10 \
    docker-workflow:521.v1a_a_dd2073b_2e \
    git:5.0.0