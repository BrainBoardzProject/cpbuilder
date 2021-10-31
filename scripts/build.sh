#!/bin/bash

# In this example we

export CPHOME=/home/happygobuilder/circuitpython

. $CPHOME/ports/espressif/esp-idf/export.sh
cd $CPHOME/ports/espressif
make -j$(nproc) BOARD=$1
