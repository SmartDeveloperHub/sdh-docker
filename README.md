# SDH Docker

Docker ecosystem for SmartDeveloperHub services (Platform &amp; Web).

##Usage

The way this repository has to be used depends on the availability of Docker in the host machine.

### Docker (recommended)

1. Run the shell script passing an argument to choose the version you want to deploy:
  * `$ sh generate_ecosystem.sh master` *(latest version)*
  * `$ sh generate_ecosystem.sh h1` *(milestone 1 version)*


These tags must correspond to either branch names or tags of the following repositories:
* [sdh-platform](https://github.com/SmartDeveloperHub/sdh-platform)
* [sdh-platform-web](https://github.com/SmartDeveloperHub/sdh-platform-web)

### Vagrant

The specific command to build and run the Vagrant VM is `vagrant up`.

Vagrant creates a VM that contains Docker and docker-compose out of the box. In case you need to manage any of the aforementioned containers, just type vagrant ssh and proceed as explained in section Using Docker-compose.

##License

SDH Docker is distributed under the Apache License, version 2.0.

