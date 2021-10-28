#!/bin/bash

export CPHOME=/home/happygobuilder/circuitpython

. $CPHOME/ports/espressif/esp-idf/export.sh
cd $CPHOME/ports/espressif
make BOARD=$1
