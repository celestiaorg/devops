FROM golang:latest

WORKDIR "/go/celestia-node"
COPY setup1.sh setup1.sh
COPY bootnode1.sh bootnode1.sh
COPY nodekey1 nodekey1
COPY boot-config1.toml boot-config1.toml

RUN chmod +x /go/celestia-node/setup1.sh
RUN chmod +x /go/celestia-node/bootnode1.sh

RUN /go/celestia-node/setup1.sh
CMD /go/celestia-node/bootnode1.sh