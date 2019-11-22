#!/bin/bash

if [ "${NETSTATS_ENABLE}" == "no" ]; then
    echo "#####################################################################################################"
    echo "## The use of netstat is disabled                                                                  ##"
    echo "#####################################################################################################"
    exit 0;
fi

echo "Waiting for the node to start and the DNS is updated..."
# Delay to wait until the node is started and the DNS is updated
sleep 30

VALIDATOR_IP=$(dig +short trustlines-validator.dappnode)
NODE_IP=$(dig +short trustlines.dappnode)

if [ ! -z "$VALIDATOR_IP" ]; then
    RPC_HOST=trustlines-validator.dappnode
elif [ ! -z "$NODE_IP" ]; then
    RPC_HOST=trustlines.dappnode
else 
    echo "Not found a valid RPC endpoint"
    exit 1
fi

if [ "${SHOW_VALIDATOR_STATUS}" == "yes" ];then
    HIDE_VALIDATOR_STATUS=false /src/start.sh
else
    HIDE_VALIDATOR_STATUS=true /src/start.sh
fi


