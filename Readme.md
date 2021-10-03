This container is designed to help with the firmware build process for CircuitPython.

Run the following commands to set up the environment. For this example we will build the Espressif Saola wrover
firmware. Feel free to customize for your env.
```sh
# Used to build the dev container
docker build --rm -t bbzbuilder .

# For interactive building
docker run -it --rm bbzbuilder:latest

# For automating the building of the firmware using the shell script
docker run -it --rm -v ${PWD}/scripts/build.sh:/home/happygobuilder/script.sh:ro -v /tmp/buildoutput:/home/happygobuilder/circuitpython/ports/espressif/build-espressif_saola_1_wrover bbzbuilder:latest  bash ./script.sh
```