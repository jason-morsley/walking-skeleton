```
fly --target ws login --username test --password test --concourse-url https://concourse.jasonmorsley.io
```

```
fly --target ws set-pipeline --config pipeline.yaml --pipeline walking-skeleton
```


To pass paramaters in on the command line use:

```
--var docker-username=jasonmorsley --var docker-password=[PASSWORD]
```

Or, to use a file , which contains the variables, use:


```
--load-vars-from credentials.yaml
```

Example credentials.yaml:

```
docker-username: jasonmorsley
docker-password: [PASSWORD]
```

i.e.

```
fly --target ws set-pipeline --config pipeline.yaml --pipeline walking-skeleton --load-vars-from credentials.yaml
```

```
fly --target ws destroy-pipeline --pipeline walking-skeleton
```