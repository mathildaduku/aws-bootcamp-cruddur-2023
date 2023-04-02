# Week 1 — App Containerization

## Required Homework
### Watched Week 1 - Live Streamed Video
- I learnt how to build images. Got to understand the concept of layers in containerization. Scratch is an official docker image which basically means an empty image, it can be used as a starting point to build other images such as debian which is a base image.
- To build an image, create file called Dockerfile (where we will put our docker configuration)
- When creating a docker file you have 

`FROM <ImageName>`

The `FROM` signifies the base image we are working with as docker files are built in layers

`WORKDIR /backend-flask` 

`WORKDIR` is almost like the home directory that comes up when you log into your terminal. In this case you are basically saying create this directory in the container and this is where we will be working, anything after this (i.e the commands) should be run in this directory.

`COPY requirements.txt requirements.txt`

`COPY` copies files from the host machine and places it in the container, the first is for the host and the second is for the container

`ENV FLASK_ENV=development`

`ENV` stands for environmental variable, this is important for the configuration of your application
- I learnt how to start a container. A container is simply an image that is running. 
- Made use of the docker extension in vscode which shows you the containers running and images available. Learnt how to go directly into the container using vscode by right clicking and selecting attach shell this is helpful for debugging. You can acheive the same thing via the command line using the command `docker exec CONTAINER_ID -it /bin/bash` .
- Learnt some docker commands
`docker image`
`docker build <image-name> -t`
`docker run <image-name>`
`docker run--rm -p <host-port-number>:<container-port-number> -d <image-name>`
`docker run --rm -p <host-port-number>:<container-port-number> -it <image-name>`

- ./ means current directory in vscode 

- tag `-t` in docker refers to name:tag if a tag is not specified it defaults to latest. An image having the "latest" tag doesnt necessarily mean it is the latest version of that image
- You can set the environmental variables in your host system and when you run the `docker run` it is able to use the variables set in the host system. Alternatively, you can pass the environmental variables along side with the `docker run` command using the flag `-e`
- Adding the flag `--rm` to your docker run command tells docker to delete the container once you decide to stop it. 
- If `--rm` is not added and the container is stopped, it will be in an exited state, and you can view it using the `docker ps -a` command, but you won't see it using the `docker ps` command because this command is only displays running containers.
- The flag `-d` stands for detached mode, which in real life you would be using more frequently. The container would be running in the background.
- The flag `-it` stands for interactive mode.
- The flag `-p` stands for port number. This exposes a specfic port on the host and container. Note to unlock the ports on vscode to enable you view your application.
- Docker compose is used to run multiple containers at a time. It saves you the stress of typing multiple commands in the command line and simplifies everything in a YAML file. To run the containers use the command `docker compose up` 
- `docker-compose up` runs it as an executable, both works!!
- Volumes can be used to mount and serve as a middle ground between the host and the container.
```YAML
volumes:
      - ./frontend-react-js:/frontend-react-js`
```
The above code mounts the frontend-react-js directory in the host machine to the frontend-react-js directory in the container. If changes are made in this directory on the host machine, it reflects on the container directory and subsequently on the application running on the container. This mounting allows for persistent data, so even if the container is stopped or deleted, the data in that directory can still be accessed on the host machine. 
