# angular-fullstack-dockerfile

This is the Docker image for the node.js yeoman generator angular-fullstack.

As the generator requires node and several npm modules this image bakes in the dependencies to reduce the time taken to deploy applications.

## branches available 
```
docker pull generatorangularfullstack/angular-fullstack-dist:latest
```

- latest
- 2.0.8
- 3.3.0
- 3.7.4
- 3.7.5
- 4.0.4
- 4.1.1
- 4.1.2
- 4.2.2
- alpine.4.0.4
- alpine.4.1.1
- alpine.4.1.2
- alpine.4.2.2

Alpine branches aren't that much smaller as some modules need python and a build chain to build. 
