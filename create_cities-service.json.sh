#!/bin/bash

cat > cities-service.json << EOF
{
   "apiVersion": "v1",
   "kind": "Service",
   "metadata": {
      "name": "${MS_NAME}",
      "labels": {
         "name": "${MS_NAME}"
      }
   },
   "spec":{
      "type": "LoadBalancer",
      "ports": [
         {
           "port": 5000,
           "targetPort": "http-server",
           "protocol": "TCP"
         }
      ],
      "selector":{
         "name":"${MS_NAME}"
      }
   }
}
EOF
