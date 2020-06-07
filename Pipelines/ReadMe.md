# Pipelines

The files in this folder are for the Concourse open sourced continuous thing-doer.

Concourse will be set up to constantly monitor the GitHub repository for changes and trigger the pipelines when changes are detected.

Why Concourse though? That's because we want to be Cloud provider agnostic.

## CI

1. Get the files from GitHub.
2. Build the application.
3. Test the application.
4. Containerise the application.
5. Upload the container to Docker Hub.

## CD

1. Download the container.
2. Deploy the container into our Kubernetes cluster.


### Concourse

https://concourse-ci.org/

Concourse can be set up locally via:

```
wget https://concourse-ci.org/docker-compose.yml
```

```
docker-compose up --detach
```

Then Concourse should be available at:

http://localhost:8080

Username: test
Password: test

However, the above is only for local testing. My aim is to have everything working with a Concourse provisioned on AWS. See: 

https://github.com/morsley-uk/infrastructure-concourse

#### Fly

Fly CLI is required to use Concourse.

Browse to any Concourse and use the download link to download the 'Fly CLI' tool for your environment. Then add it to your PATH.