# Infrastructure-Chatbot

## Table of Contents
- [Overview](#overview)
- [Local Development Setup](#local-development-setup)
- [Production Setup](#production-setup)

## Overview
The Infrastructure-Chatbot repository contains the necessary files to run the infrastructure services for the ACCESS AI project. The infrastructure services include the following components:
- **Keycloak**: An open-source identity and access management solution.
- **PostgreSQL**: An open-source relational database.
- **Vector Store**: A service for storing and querying vectors.
- **Context Service**: A service for storing and querying context information.

## Local Development Setup

### Prerequisites
- Download the necessary repositories:
    ```bash
    git clone https://github.com/ACCESS-AI/Frontend-Re.git
    git clone https://github.com/ACCESS-AI/Infrastructure-RE.git
    git clone https://github.com/ACCESS-AI/Context-Service.git
    git clone https://github.com/ACCESS-AI/Backend-Re.git
    git clone https://github.com/ACCESS-AI/Chatbot.git
    ```

### 1. Run the Infrastructure
1. Insert your Mistral AI API key in the `MISTRAL_API_KEY` variable of the `.env` file in the `Infrastructure-Chatbot` directory.
2. Choose a working directory for saving the course repositories and insert it in the `WORKING_DIR` variable of the `.env` file in the `Infrastructure-Chatbot` directory.
3. If you wish to change the default values of the environment variables, you can do so by editing the `.env` file in the `Infrastructure-Chatbot` directory.
4. Run the following command to start the infrastructure services:
```bash
cd Infrastructure-Chatbot
docker compose up -d
```

### 2. Run the Context Service (optional: if you want to develop the context service)
1. Stop the context service container which is automatically started by the Infrastructure Chatbot `docker compose up -d` command.
2. Follow the steps in the README.md file of the Context Service repository.

### 3. Build and Publish the Chatbot Library
1. If you want to change the default publishsing method, refer to the README.md file of the Chatbot repository.
2. Run the following command to build and publish the Chatbot library:
    ```bash
    cd Chatbot
    ./gradlew publish
    ```

### 4. Run the Backend
1. Load the Backend-Re-Chatbot project in IntelliJ.
2. In the run configuration for `AccessApplicationKt`, add the following environment variables:
    - `WORKING_DIR` should be an existing empty directory that ACCESS will use to clone course repos.
    - `API_KEY` is a mock key used for the ACCESS API.
    - `MISTRAL_API_KEY` is the API key for the Mistral API.
    - `MISTRAL_EMBEDDING_MODEL` is the URL of the Mistral embedding model.
    - `MISTRAL_EMBEDDING_HOST` is the host of the Mistral embedding model.
    - `MISTRAL_LLM_MODEL` is the URL of the Mistral LLM model.
    - `MISTRAL_LLM_HOST` is the host of the Mistral LLM model.
    - `VECTOR_STORE_HOST` is the host of the vector store.
    - `SIMILARITY_SCORE_THRESHOLD` is the similarity score threshold for the vector store.
    - `TOP_K_RESULTS` is the number of top results to return from the vector store.
    - `CHATBOT_DB_URL` is the URL of the chatbot database.
    - `CHATBOT_DB_USER` is the username of the chatbot database.
    - `CHATBOT_DB_PASSWORD` is the password of the chatbot database.
    - `CHATBOT_CONTEXT_SERVICE_URL` is the URL of the context service.
2. Replace all occurrences of `0.0.0.0` in the backend with `localhost`.
3. Run the backend.

### 5. Run the Frontend
1. Run the following command to install the frontend dependencies:
    ```bash
    cd Frontend-Re-Chatbot
    npm install
    ```

2. Run the following command to start the frontend:
    ```bash
    npm start
    ```

<!-- ### 6. Set password for student and supervisor accounts in Keycloak
1. Access [Keycloak Admin Console](http://localhost:8080) using the following credentials:
    - Username: `admin`
    - Password: `admin`

2. Select the `access` realm, go to `Users`, select the a user, go to `Credentials` and set a new password.


### 7. Create a Course
1. Log into the frontend with the supervisor account.
2. Click on `import new course` and provide the following details:
    - Repo: `http://github.com/master-project-nat-ara-tom-23-24/Mock-Course-Re` (or any other course repository)
    - Course slug: `mock-slug` (or any other slug)

### 8. Assign Course to Student
1. Replace the `mock_course` with the course slug and run either of the following commands:
    - PowerShell:
        ```powershell
        Invoke-RestMethod -Uri 'http://localhost:8081/api/courses/mock-slug/participants' -Method POST -Headers @{'Content-Type'='application/json';'X-API-Key'='1234'} -Body '["student@uzh.ch"]'
        ```
    - cURL:
        ```bash
        curl -X POST 'http://localhost:8081/api/courses/mock-course/participants' -H 'Content-Type: application/json' -H 'X-API-Key: 1234' --data '["student@uzh.ch"]'
        ``` -->

## Production Setup

### Prerequisites
- Make sure the `Backend-Re` has the correct `gradle.properties` file based on the chosen publishing method. For more information, refer to the README.md file of the Chatbot repository.


### 1. Run all components frm the Infrastructure
1. Add the correct values to the empty environment variables in the `.env_prod` file in the `Infrastructure` directory.
2. If you wish to change the default values of the environment variables, you can do so by editing the `.env_prod` file in the `Infrastructure` directory.
3. Run the following command to start the infrastructure services:
```bash
cd Infrastructure
docker compose -f docker-compose-prod.yml --env-file .env_prod up -d
```