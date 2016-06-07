# angular-fullstack-dockerfile

This is the Docker image for the node.js yeoman generator angular-fullstack.

As the generator requires node and several npm modules this image bakes in the dependencies to reduce the time taken to deploy applications.

## Construction

This image uses the standard node.js 4.2.2 image. 

It is tied into the docker hub and will automatically include upstream changes.

## Usage

**waiting for inclusion** 

You will be able to do 

    yo angular-fullstack:docker
    
Which will add the Dockerfile to your dist folder

This can then be built using the standard docker tools

The Dockerfile will survive
    
    grunt clean
    
operations

## Tracking

As angular-fullstack evolves and npm references change this repo will track the version numbers and create a new branch which will then create a new docker container per branch