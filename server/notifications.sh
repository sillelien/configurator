#!/bin/bash
cd /repo/config
socat UDP4-RECVFROM:6666,ip-add-membership=224.1.0.1:$(hostname -i),fork EXEC:'echo Push notification received'