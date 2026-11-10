# QT Creator Image

A very basic template `Dockerfile` and `compose.yml` to have QT Creator working on Ubuntu 24.04 with the GUI enabled.

To use this image:

- Create a Dockerfile that departs `FROM` the one defined [here](https://github.com/ffasilva/docker-compose/blob/main/images/qt_creator/Dockerfile). In it, copy any project you want to work in QT Creator into the folder `/app`. For instance:

```
FROM ghcr.io/ffasilva/qt_creator:09_11_2026_18_46_18
ENV BASH_ENV="/etc/bash_env"

# Update and clean
RUN apt-get update -q \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy files from this repository to the image
WORKDIR /app

COPY ./my_folder/my_project /app/my_folder/my_project
```

- Create a copy of the [compose.yml](https://github.com/ffasilva/docker-compose/blob/main/images/qt_creator/compose.yml) and modify the line `dockerfile: images/qt_creator/Dockerfile` to use the Dockerfile from the previous step.
- Run the container:

```bash
xhost +local:root
docker compose up --build -d
```

- Once finished, stop the containers. Press `Ctrl + C` and run:

```bash
docker compose down -v --remove-orphans
```

Assuming you're running Docker Compose from `my_folder/my_project`, you will find copies of the modified files in `my_folder/my_project/source`.
