# cpbuilder

This container is designed to help build firmwares based on CircuitPython.

Run the following commands to set up the environment under the Linux environment. For this example we will build the Espressif Saola wrover
firmware. Feel free to customize for your env.

```sh
# Used to build the dev container
$ docker build --rm -t cpbuilder:0.1 .

# For interactive building
$ docker run -it --rm cpbuilder:0.1

# For automating the building of the firmware using the shell script
$ docker run -it --rm -v ${PWD}/scripts/build.sh:/home/happygobuilder/script.sh:ro -v /tmp/buildoutput:/home/happygobuilder/circuitpython/ports/espressif/build-espressif_saola_1_wrover cpbuilder:0.1  bash ./script.sh
```

The following instructions provided below show how you can edit the Espressif firmware to build a custom CircuitPython firmware. In this example, we will build a custom CircuitPython firmware for the BrainBoardz Neuron.

```sh
$ cp -r ports/espressif/boards/espressif_saola_1_wrover ports/espressif/boards/brainboardz_neuron_v1

# Step 1: edit ports/espressif/boards/brainboardz_neuron_v1/mpconfigboard.h, ports/espressif/boards/brainboardz_neuron_v1/mpconfigboard.mk to meet your design needs
# Step 2: edit scripts/build.sh to change make BOARD=espressif_saola_1_wrover to make BOARD=brainboardz_neuron_v1 
# Step 3: run the docker command below

docker run -it --rm -v ${PWD}/scripts/build.sh:/home/happygobuilder/script.sh:ro -v /tmp/buildoutput:/home/happygobuilder/circuitpython/ports/espressif/brainboardz_neuron_v1 -v ${PWD}/ports/espressif/boards/brainboardz_neuron_v1:/home/happygobuilder/circuitpython/ports/espressif/boards/brainboardz_neuron_v1:ro cpbuilder:0.1  bash ./script.sh
```
