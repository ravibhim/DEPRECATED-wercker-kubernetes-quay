#!/bin/bash

cat > cities-deployment.json <<EOF
{
  "apiVersion": "apps/v1beta1",
  "kind": "Deployment",
  "metadata": {
    "name": "${MS_NAME}"
  },
  "spec": {
    "replicas": 3,
    "strategy": {
      "type": "RollingUpdate",
      "rollingUpdate": {
        "maxSurge": 1,
        "maxUnavailable": 1
      }
    },
    "minReadySeconds": 5,
    "template": {
      "metadata": {
        "labels": {
          "name": "${MS_NAME}",
          "deployment": "${WERCKER_GIT_COMMIT}"
        }
      },
      "spec": {
        "containers": [
          {
            "imagePullPolicy": "Always",
            "image": "ravibhim/golang-example:${WERCKER_GIT_COMMIT}",
            "name": "${MS_NAME}",
            "ports": [
              {
                "name": "http-server",
                "containerPort": 5000,
                "protocol": "TCP"
              }
            ]
          }
        ]
      }
    }
  }
}
EOF
