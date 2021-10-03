FROM ubuntu:focal-20210921

ARG DEBIAN_FRONTEND=noninteractive

RUN set -eux; \
    apt update ; \
    apt install -y bash build-essential cmake gettext git libusb-1.0-0 ninja-build python3 python3-pip; \
    update-alternatives --install /usr/bin/python python /usr/bin/python3 10 ; \
    python -m pip install --upgrade pip virtualenv ; 

RUN useradd -ms /bin/bash happygobuilder 

# USER happygobuilder <-- need to fix this
WORKDIR /home/happygobuilder

ENV PATH="/home/happygobuilder/.local/bin:$PATH"
ENV IDF_PATH="/home/happygobuilder/circuitpython/ports/espressif/esp-idf"

RUN pip3 install click ; \
    git clone https://github.com/BrainBoardzProject/circuitpython.git ; \
    cd circuitpython ; \ 
    git submodule update --init --recursive ; \ 
    cd ports/espressif/esp-idf ; \
    ./install.sh 

CMD [ "/bin/bash" ]