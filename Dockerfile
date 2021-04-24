FROM ubuntu:20.04

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y python3.8-venv python3.8-distutils python3-pip python3-miniupnpc python3-setproctitle git

RUN git clone https://github.com/Chia-Network/chia-blockchain.git /opt/chia-blockchain

WORKDIR /opt/chia-blockchain

RUN python3.8 -m pip install wheel cbor2
RUN python3.8 -m pip install -i https://download.chia.net/simple/ miniupnpc==2.1 setproctitle==1.1.10 cbor2==5.2.0
RUN python3.8 -m pip install -e .
