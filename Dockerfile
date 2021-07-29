FROM nethermind/nethermind

WORKDIR /nethermind

RUN mkdir -m 777 -p ./data

COPY ./config/genesis.json ./chainspec/genesis.json

COPY ./config/config.cfg ./config/config.cfg

COPY ./config/static-nodes.json ./

VOLUME ["/nethermind/nethermind_db", "/nethermind/keystore", "/nethermind/logs"]

EXPOSE 30303 8545 8546 9091 3000

ENTRYPOINT ["./Nethermind.Runner", "--JsonRpc.Enabled", "true", "--configsDirectory", "/nethermind/config", "--config", "config"]

