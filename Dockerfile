FROM ubuntu:focal-20210921

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y  \
    bash \
    build-essential \
    cmake \ 
    gettext \ 
    git \
    libusb-1.0-0 \
    ninja-build \ 
    python3 \
    python3-pip \
    python-is-python3 \
    && update-alternatives --install /usr/bin/python python /usr/bin/python3 10 \
    && python -m pip install --upgrade pip virtualenv \
    && rm -rf /var/lib/apt/lists/* 

RUN useradd -ms /bin/bash happygobuilder 

# USER happygobuilder <-- need to fix this to drop perms from root
WORKDIR /home/happygobuilder

ENV PATH="/home/happygobuilder/.local/bin:$PATH"
ENV IDF_PATH="/home/happygobuilder/circuitpython/ports/espressif/esp-idf"

RUN pip3 install click \
    && git clone https://github.com/adafruit/circuitpython.git \
    && cd circuitpython \ 
    && git submodule sync --quiet --recursive \ 
    && git submodule update --init \
    && pip3 install -r requirements-dev.txt \
    && make -C mpy-cross \
    && cd ports/espressif/esp-idf \
    && ./install.sh 

CMD [ "/bin/bash" ]