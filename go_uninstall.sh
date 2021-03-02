#!/bin/bash
source .goversion

# 移除 go 
echo "Remove go"
rm -rf /usr/local/go/${GO_VERSION}

sed -i '/########## add go path #########/d' ~/.bashrc

sed -i '/usr\/local\/go/d' ~/.bashrc

source ~/.bashrc

echo "Please execute command \"source ~/.bashrc\""