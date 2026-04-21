# 🚀 CI/CD Pipeline for Dockerized Flask App (AWS)

## 📌 Overview

This project demonstrates an end-to-end CI/CD pipeline for a Dockerized Flask application using AWS services.

The pipeline automates:

* Building a Docker image
* Pushing the image to Docker Hub
* Deploying the application to an EC2 instance

---

## 🧱 Architecture

```
GitHub (Source Code)
        ↓
AWS CodePipeline
        ↓
AWS CodeBuild (Build + Push Docker Image)
        ↓
AWS CodeDeploy (Deployment)
        ↓
EC2 Instance (Runs Docker Container)
```

---

## 🛠️ Tech Stack

* Python (Flask)
* Docker
* AWS CodePipeline
* AWS CodeBuild
* AWS CodeDeploy
* Amazon EC2
* AWS Systems Manager (Parameter Store)
* Docker Hub

---

## 📁 Project Structure

```
simple-flask-app/
│
├── app.py
├── requirements.txt
├── Dockerfile
├── buildspec.yml
├── appspec.yml
└── scripts/
    ├── install_dependencies.sh
    └── start_app.sh
```

---

## ⚙️ Setup & Implementation

### 1️⃣ Flask Application

* Created a simple Flask app (`app.py`)
* Defined dependencies in `requirements.txt`

---

### 2️⃣ Dockerization

* Built Docker image using Dockerfile
* Tagged and pushed image to Docker Hub

```
docker build -t <username>/simple-h-flask-app .
docker push <username>/simple-h-flask-app:latest
```

---

### 3️⃣ Secure Credential Storage

Used AWS Systems Manager Parameter Store to store:

* Docker Hub username
* Docker Hub Personal Access Token (PAT)

---

### 4️⃣ AWS CodeBuild

Configured using `buildspec.yml` to:

* Install dependencies
* Build Docker image
* Authenticate with Docker Hub
* Push image to Docker Hub

---

### 5️⃣ EC2 Setup

* Launched Ubuntu EC2 instance
* Installed:

  * Docker
  * CodeDeploy Agent
* Opened ports:

  * 22 (SSH)
  * 5000 (Application)

---

### 6️⃣ AWS CodeDeploy

* Created application and deployment group
* Used EC2 tag-based targeting
* Deployment type: In-place

---

### 7️⃣ Deployment Configuration

#### appspec.yml

Defines deployment lifecycle and script execution

#### Scripts

* `install_dependencies.sh` → installs required tools
* `start_app.sh` → pulls latest Docker image and runs container

---

### 8️⃣ AWS CodePipeline

Pipeline stages:

1. Source → GitHub
2. Build → CodeBuild
3. Deploy → CodeDeploy

Automatically triggers on code changes

---

## 🔁 Workflow

1. Code is pushed to GitHub
2. CodePipeline triggers automatically
3. CodeBuild:

   * Builds Docker image
   * Pushes to Docker Hub
4. CodeDeploy:

   * Pulls latest image on EC2
   * Stops old container
   * Runs updated container

---

## 🎯 Key Learnings

* CI/CD pipeline design
* Docker image lifecycle
* AWS service integration
* Infrastructure automation
* IAM roles and permissions
* Secure credential management

---

## 💡 Outcome

Achieved a fully automated deployment pipeline where:

* Code changes → Build → Deploy → Live on EC2

---

## 🧠 Future Improvements

* Use Amazon ECR instead of Docker Hub
* Deploy using ECS (Fargate)
* Add Load Balancer (ALB)
* Implement monitoring with CloudWatch
* Add rollback strategies

---


