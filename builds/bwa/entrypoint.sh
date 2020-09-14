#!/bin/sh
THREADS=4
echo "request: $@"
if [ "$1" != "bwa" ]; then
    echo "failed"
    exit 1
fi

if [ "$2" = "mem" ]; then
    echo list
    ls -l $4

    echo output dir
    mkdir -p $(dirname $5)

    echo do
    # "bwa mem genomes/{genome} {input} > {output}"
    # com="bwa mem genomes/$3 $4 > $5"
    com="bwa mem -t $THREADS genomes/$3 $4 > $5"
else
    com="echo unknown command"
fi

echo -e "command:\n\$ $com"
# echo "command:\n\$ $com"
eval $com
exit 0
