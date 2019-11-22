#FROM trustlines/netstats-client:release51
FROM trustlines/netstats-client@sha256:957a2b5c482df922dd4d109cee93ac6130ac13eefd1583545d41b1b117e98192

RUN apt-get update && \
	apt-get install -y dnsutils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
    
ENV RPC_HOST=trustlines-validator.dappnode
ENV RPC_PORT=8545 
ENV WS_HOST=netstats.tlbc.trustlines.foundation

ADD entrypoint.sh /usr/local/bin/entrypoint

ENTRYPOINT ["entrypoint"]