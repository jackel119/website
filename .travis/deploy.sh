#!/usr/bin/env bash
set -eu

mkdir -p $HOME/.ssh
openssl aes-256-cbc \
    -K $encrypted_d1ccd9bf6ff3_key \
    -iv $encrypted_d1ccd9bf6ff3_iv \
    -in .travis/id_rsa.enc -out $HOME/.ssh/id_rsa -d
chmod 600 $HOME/.ssh/id_rsa

git config --global user.name "DoCSoc Travis Deployer"
git config --global user.email "docsoc@imperial.ac.uk"

make deploy
