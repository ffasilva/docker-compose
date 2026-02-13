# Docker Compose
A repository with some useful Docker images and installation recipes for composition.

## Useful Docker instructions

#### Using an external camera macOS (Apple Silicon)

To use an external camera on your Mac, you'll need to [share your USB devices with Docker](https://docs.docker.com/desktop/features/usbip/). Unfortunately, this is a somewhat manual process that will require you to run a privileged Docker container and attach the right USB device to it. Only then will your external camera be available to other containers.

First, follow the instructions to install [cargo](https://ports.macports.org/port/cargo/). This might take several minutes.

Now, follow the official Docker [instructions](https://docs.docker.com/desktop/features/usbip/) to use USB/IP with Docker Desktop. You'll need to follow this procedure, starting from "Step two: Start a privileged Docker container" every time you want to use an external camera.
