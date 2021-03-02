#!/bin/bash
source .goversion

# 下載 golang tar.gz
wget -c \
https://golang.org/dl/go${GO_VERSION}.linux-amd64.tar.gz

if [ ! -d /usr/local/go ];then
    mkdir -p /usr/local/go
fi

# 解壓縮 tar.gz
tar -C ./  -xzf  go${GO_VERSION}.linux-amd64.tar.gz

# 搬移到正確位置
mv ./go /usr/local/go/${GO_VERSION}

# 移除 golang  tar.gz
echo "remove go${GO_VERSION}.linux-amd64.tar.gz"
rm -f go${GO_VERSION}.linux-amd64.tar.gz

# 加入 PATH
echo "add PATH"
echo ""  >> ~/.bashrc
echo "########## add go path #########"  >> ~/.bashrc
echo "export PATH=\${PATH}:/usr/local/go/${GO_VERSION}/bin" >> ~/.bashrc

source ~/.bashrc

# 顯示 go version
echo "########## go version ##########"
go version

echo "Please execute command \"source ~/.bashrc\""