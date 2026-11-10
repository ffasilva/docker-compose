# Docker Compose
A repository with some useful Docker images and installation recipes for composition.

## How to run the containers

- Go to the folder of the image you want to use
- Run:

```bash
xhost +local:root
docker compose up --build -d
```

- Once finished, stop the containers. Press `Ctrl + C` and run:

```bash
docker compose down -v --remove-orphans
```

Some images are meant to be used as a base for your images. For instance, [dq_robotics](https://github.com/ffasilva/docker-compose/tree/main/images/dq_robotics) uses [qt_creator](https://github.com/ffasilva/docker-compose/tree/main/images/qt_creator) as a base image in its [Dockerfile](https://github.com/ffasilva/docker-compose/blob/main/images/dq_robotics/Dockerfile). Check their README.md for more details.
