#!/bin/bash 

sudo apt-get update 
sudo apt-get -y install  build-essential asciidoc binutils bzip2 gawk \
	gettext git libncurses5-dev libz-dev patch unzip zlib1g-dev lib32gcc1 \
	libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib p7zip p7zip-full \
	msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx libelf-dev \
	autoconf automake libtool autopoint device-tree-compiler python3-pip virtualenv \
	python3-numpy python3-dev python3-wheel git unzip wget bash-completion \
	build-essential cmake  software-properties-common  git wget patch diffutils libtinfo-dev \
	autoconf libtool doxygen graphviz

wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
sudo apt-add-repository "deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-9 main"
sudo apt-get update && sudo apt install -y clang-9 clang-tidy-9 clang-format-9

pip3 install --upgrade pip setuptools virtualenv==16.1.0

pip3 install cmake --upgrade

wget https://github.com/bazelbuild/bazel/releases/download/0.25.2/bazel-0.25.2-installer-linux-x86_64.sh
chmod +x ./bazel-0.25.2-installer-linux-x86_64.sh
sudo ./bazel-0.25.2-installer-linux-x86_64.sh

git clone  https://github.com/yifengyou/he-transformer.git  he-transformer

cd he-transformer
export HE_TRANSFORMER=$(pwd)
mkdir build
cd build
cd $HE_TRANSFORMER/build
cmake .. -DCMAKE_CXX_COMPILER=clang++-6.0

make install
