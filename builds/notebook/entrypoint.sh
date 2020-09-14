#!/bin/sh
THREADS=4
echo "request: $@"
if [ "$1" != "notebook" ]; then
    echo "failed"
    exit 1
fi

com="jupyter notebook --ip 0.0.0.0 --allow-root"

echo -e "command:\n\$ $com"
# echo "command:\n\$ $com"
eval $com
exit 0
