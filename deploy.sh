#!/bin/bash

ENV=$1

echo "Deploying to $ENV environment"

if [ "$ENV" = "qa" ]; then
  SERVER="qa-vm-ip"
elif [ "$ENV" = "staging" ]; then
  SERVER="staging-vm-ip"
elif [ "$ENV" = "prod" ]; then
  SERVER="prod-vm-ip"
fi

scp target/sync-service.jar user@$SERVER:/opt/sync-service/

ssh user@$SERVER << EOF
sudo systemctl stop sync-service
sudo systemctl start sync-service
EOF

echo "Deployment completed for $ENV"
