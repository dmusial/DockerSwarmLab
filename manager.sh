#!/bin/bash

sudo docker swarm init --advertise-addr $1
sudo docker swarm join-token -q worker > worker_join_token