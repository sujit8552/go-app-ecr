
# Automating Golang Image Upload to AWS ECR using GitHub Actions

This workflow automates the process of building and pushing a Golang application image to AWS ECR upon a push to the master branch. 
(This Golang app is also deployed to EC2 instnace as part of assignment URL to access webapp)

## Workflow Configuration

### Trigger:
This workflow runs on every push to the master branch

### Jobs:
#### build-and-push:
Runs on ubuntu latest runner
### Steps:
#### SCM Checkout:
Checks out the code from the Git repository.
#### Configure the AWS Credentials:
Configures the AWS credentials with the secrets stored in the GitHub repository.
#### Login to AWS ECR:
Logs in to the AWS ECR registry using the configured credentials.
#### Build, Tag and Push the image to AWS ECR:
* Builds the Docker image for the Golang application.
* Tags the image with the ECR registry URL, repository name, and image tag.
* Pushes the image to the AWS ECR repository.
### Environment Variables
* ECR_REGISTRY: The URL of the AWS ECR registry.
* ECR_REPOSITORY: The name of the AWS ECR repository.
* IMAGE_TAG: The image tag.
### Secrets
* AWS_ACCESS_KEY_ID: The AWS access key ID.
* AWS_SECRET_ACCESS_KEY: The AWS secret access key.
* PRIVATE_SSH_KEY: The private ssh key for instance.
* SERVER_PUBLIC_IP: The public ip of server.
* SSH_PORT: The ssh port for server.(22)
### Advantages
* #### Automates image building and uploading:
    Saves time and effort by automating the process of building and uploading the image to AWS ECR.
* #### Consistent builds:
    Ensures consistent builds across different environments.
* #### Reduced risk of errors: 
    Reduces the risk of errors by automating the process.
* #### Fast build times: 
    Uses the cache and distroless image to speed up the build process.
* #### Securely stored credentials: 
    Stores the AWS credentials securely in the GitHub repository secrets.
### Requirements
* Docker
* An AWS ECR repository
### Getting Started
    1) Clone the repository to your local machine.
    2) Build the Docker image locally: docker build -t <image_name> ..
    3) Run the image locally: docker run -p <port>:<port> <image_name>.
    4) Push the image to AWS ECR manually: docker push <ecr_registry>/<ecr_repository>:<image_tag>.
    5) Add the AWS credentials and secrets to your GitHub repository.
    6) Push your code to the master branch.
    7) The workflow will automatically build and push the image to AWS ECR.
    8) Also go-app is deployed on EC2 instance to showcase the working web application.
       Access web-app at -> http://54.205.83.51:5000 

Deployed as part of assignment to share URL on google form for working web-app.
The size of the image comes down to very much less 3.88 MB only due to use of distroless image and caching which also improves the security of the web-application.
By using this workflow, we can automate the process of building and uploading your Golang application image to AWS ECR. This will save our time and effort, and it will help you to ensure that your application is always running the latest version of the code.
