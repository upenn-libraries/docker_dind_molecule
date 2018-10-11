# Docker in Docker for Molecule

This image is based off of the [official Docker in Docker image](https://hub.docker.com/_/docker/). It is intended to be used as a base image by [Molecule](https://molecule.readthedocs.io/en/latest/) when testing Ansible roles that deploy Docker containers.

## Usage

You can configure Molecule to use this image in `molecule.yml`. The container will need to run in privileged mode and you will need to start the Docker daemon.

```
platforms:
  - name: instance
    image: quay.io/upennlibraries/dind_molecule
    command: dockerd-entrypoint.sh
    privileged: true
```

If you want to run Docker in swarm mode, you can run the Docker daemon in background, initialize the swarm, and then manually run the default sleep command used by Molecule to keep the container up.

```
platforms:
  - name: instance
    image: quay.io/upennlibraries/dind_molecule
    command: bash -c "dockerd-entrypoint.sh & docker swarm init; while true; do sleep 10000; done"
    privileged: true
```
