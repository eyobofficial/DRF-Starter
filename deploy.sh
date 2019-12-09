#!/bin/bash

openssl aes-256-cbc -K $encrypted_a83ec8a93e11_key -iv $encrypted_a83ec8a93e11_iv \
    -in deploy_key.enc -out ./deploy_key -d
chmod 600 ./deploy_key
ssh-add ./deploy_key
eval "$(ssh-agent -s)"
echo -e "Host $SERVER_IP_ADDRESS\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config
ssh -i ./deploy_key root@$SERVER_IP_ADDRESS pwd

echo 'Logged...'
echo $HOSTNAME
touch check.txt
