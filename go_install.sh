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
if [ -f  ~/.zshrc ];then
    bashfile=~/.zshrc
else
    bashfile=~/.bashrc
fi

echo "add PATH"
echo ""  >> ${bashfile}
echo "########## add go path #########"  >> ${bashfile}
echo "export PATH=\${PATH}:/usr/local/go/${GO_VERSION}/bin" >> ${bashfile}

source ${bashfile}

# 顯示 go version
echo "########## go version ##########"
go version

echo "Please execute command \"source ${bashfile}\""