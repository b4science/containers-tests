#!/bin/sh
echo "request: $@"
if [ "$1" != "samtools" ]; then
    echo "failed"
    exit 1
fi

if [ "$2" = "view" ]; then
    com="samtools view -Sb ${3} > ${4}"
elif [ "$2" = "sort" ]; then
    com="samtools sort -T ${3}.tmp -O bam ${3} > ${4}"
else
    com="echo hello world"
fi

echo -e "command:\n\$ $com"
# echo "command:\n\$ $com"
eval $com
exit 0
