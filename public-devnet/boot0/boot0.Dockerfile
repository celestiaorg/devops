FROM golang:latest

WORKDIR "/go/celestia-node"
COPY setup0.sh setup0.sh
COPY bootnode0.sh bootnode0.sh
COPY nodekey0 nodekey0
COPY boot-config0.toml boot-config0.toml

RUN chmod +x /go/celestia-node/setup0.sh
RUN chmod +x /go/celestia-node/bootnode0.sh

RUN /go/celestia-node/setup0.sh
CMD /go/celestia-node/bootnode0.sh