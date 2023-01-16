# Devops Project: video-converter
Converting mp4 videos to mp3 in a microservices architecture.


# Used Technology
![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)
![RabbitMQ](https://img.shields.io/badge/Rabbitmq-FF6600?style=for-the-badge&logo=rabbitmq&logoColor=white)
![Postgres](https://img.shields.io/badge/postgres-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white)
![MongoDB](https://img.shields.io/badge/MongoDB-%234ea94b.svg?style=for-the-badge&logo=mongodb&logoColor=white)
![Kubernetes](https://img.shields.io/badge/kubernetes-%23326ce5.svg?style=for-the-badge&logo=kubernetes&logoColor=white)
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)
![Flask](https://img.shields.io/badge/flask-%23000.svg?style=for-the-badge&logo=flask&logoColor=white)
![JWT](https://img.shields.io/badge/JWT-black?style=for-the-badge&logo=JSON%20web%20tokens)

# Architecture

<p align="center">
  <img src="./Project documentation/Architecture.png" width="600" title="Architecture" alt="Architecture">
  </p>

# Observability
## 1.Metrics
We implemented the following metrics:
- A metric that allow us to track how many request we are
processing

- We used prometheus to collet metrics data and grafana to visualize them


# Automation

## Helm
We created Helm Charts (for MongoDB, Postgres and RabbitMQ) that Argo CD will use for automated deployment. 
Once Argo CD observes a change in the infrastructure desired state in the github repository, it will apply those changes.


## Terraform
We used Terraform which is an IAC tool to provision infrastructure and set-up the first Helm charts.
We built 5 well isolated and maintainable infrastructure layers (Microstacks):
- Layer0: Defining and configuring Auzre remote backend
- Layer1: Provisioning an Azure Kubernetes Cluster (uses remote backend from layer0)
- Layer2: Provisioning MongoDB, Postgres, and RabbitMQ ressources based on the helm charts that we prepared
- Layer3: Adding Prometheus and Grafana to the provisioned cluster
- Layer4: Provisioning and setting up ArgoCD


# Deployment
We built the app using Docker and then Kubernetes for deployment

## Deployment Strategy


# API Definiton
- Login endpoint
```http request
POST http://gateway.3001cf25469d4824b0ad.westeurope.aksapp.io/login
```
> curl -X POST http://gateway.3001cf25469d4824b0ad.westeurope.aksapp.io/login -u \<email\>:\<password\>

- Upload endpoint
```http request
POST http://gateway.3001cf25469d4824b0ad.westeurope.aksapp.io/upload
```
> curl -X POST -F 'file=@./video.mp4' -H 'Authorization: Bearer \<JWT Token\>' http://gateway.3001cf25469d4824b0ad.westeurope.aksapp.io/upload

- Download endpoint
```http request
GET http://gateway.3001cf25469d4824b0ad.westeurope.aksapp.io/download?fid=<Generated file identified>
```
> curl --output video.mp3 -X GET -H 'Authorization: Bearer \<JWT Token\>' "http://gateway.3001cf25469d4824b0ad.westeurope.aksapp.io/download?fid= \<Generated fid\>"
