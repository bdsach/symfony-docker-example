# Symfony Dockerized Application

This repository contains a Symfony application configured to run within a Docker container.

## Prerequisites

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)

## Getting Started

### Building the Docker Image

```bash
docker build -t yourusername/symfony-docker-app .
```

### Running the Docker Image

```
docker run -p 8000:8000 -it yourusername/symfony-docker-app
```
