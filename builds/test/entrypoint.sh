#!/bin/sh
echo $1 $2
com="echo hello $3 > $4"
echo -e "command:\n$com"
eval $com
