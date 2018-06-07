#!/bin/bash

sudo yum -y install sshpass
sshpass -p "vagrant" scp -o StrictHostKeyChecking=no -r vagrant@172.20.20.100:~/worker_join_token ~/worker_join_token
sudo docker swarm join --token `cat ~/worker_join_token` $1:2377
rm ~/worker_join_token