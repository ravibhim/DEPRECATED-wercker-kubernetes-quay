#!/bin/bash

cat > cities-controller.json <<EOF
{
  "apiVersion": "v1",
  "kind": "ReplicationController",
  "metadata": {
    "name": "cities",
    "labels": {
      "name": "cities"
    }
  },
  "spec": {
    "replicas": 3,
    "selector": {
      "name": "cities"
    },
    "template": {
      "metadata": {
        "labels": {
          "name": "cities",
          "deployment": "${WERCKER_GIT_COMMIT}"
        }
      },
      "spec": {
        "containers": [
          {
            "imagePullPolicy": "Always",
            "image": "ravibhim/golang-example:${WERCKER_GIT_COMMIT}",
            "name": "cities",
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
