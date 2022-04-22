# Development and Build Instructions

Prefer using jdk 11 to build this app.

## Pre-requisites

You have many options for running and installing this app. You can install
netbeans, you can install intellij etc. You also need to install a Java EE
edition server to run the app locally.

To build and test the app a jdk is required, prefer openjdk 11 you can download
from here <https://adoptium.net/temurin/releases>

To run the app I think the easiest way and the best way due to consistency is
to use the included docker instances.

## Run through docker

1. Install docker <https://docs.docker.com/get-docker/>

2. run `docker compose up --build`

3. navigate to `http://localhost:8080/IoTBay-1.0-SNAPSHOT/`

