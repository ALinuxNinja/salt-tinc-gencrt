#!/bin/bash

## Set Hostname
HOST=$1
## Set Key Size
RSA=2048

## Move back to the right dir
cd $(dirname $(readlink -f $0))

## Delete keys if already existing
if [ -d $HOST/ ];
	rm -rf $HOST/
fi

mkdir -p $HOST/
cp host_template $HOST/host
openssl genpkey -algorithm RSA -out $HOST/rsa_key.priv $RSA
openssl rsa -pubout -in $HOST/rsa_key.priv -out $HOST/rsa_key.pub
cat $HOST/rsa_key.pub >> $HOST/host
