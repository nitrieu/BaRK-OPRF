#!/usr/bin/env bash

# read the arguments without party id

argc=$#
argv=($@)

# read parties file
parties=()
while IFS= read -r line || [[ -n "${line}" ]]; do
    l=`echo ${line} | cut -d'=' -f2`
    parties+=(${l})
done < parties.conf

idx=${1}
addr=${parties[0]}

cd ..
./Release/bOPRFmain.exe -r ${idx} -ip ${addr}
