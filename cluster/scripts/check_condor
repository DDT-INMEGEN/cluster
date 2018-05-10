#!/bin/bash
CHECKTYPE=0;
CHECK="";
while getopts H:S:saw:c: option
do
        case "${option}"
                in
                H) HOST=${OPTARG};;
                S) SLOT=${OPTARG};;
                s) CHECKTYPE=1
                CHECK="State";;
                a) CHECKTYPE=2
                CHECK="Activity";;
                c) WARNING=${OPTARG};;
                w) CRITIVAL=${OPTARG};;
                :) echo "Missing option argument for -$OPTARG" >&2; exit 1;;
        esac
done

if [ -z "$HOST" ]
then
        echo "HOST is required"
        exit 1
fi

if [ -z "$NODE" ]
then
    NODE="slot1"
fi

STATUSCMD="condor_status ${NODE}@${HOST}"
STATUS=$($STATUSCMD)
if [ ! -z "${STATUS}" ];then
        case $CHECKTYPE in
                0)  echo "OK - Node is reachable|state=1"
                        ;;
                1)  OUTVAL=$(echo $STATUS|awk '{print$12}')
                    if [ "$OUTVAL" == "Claimed" ] ; then
                        STATE=1
                    else
                        STATE=0
                    fi
                        echo "OK - Node is  "${OUTVAL}" |state=${STATE}"
                        ;;
                2)
                    OUTVAL=$(echo $STATUS|awk '{print$13}')
                    if [ "$OUTVAL" == "Busy" ] ; then
                        ACTIVITY=1
                    else
                        ACTIVITY=0
                    fi
                        echo "OK - Node is  "${OUTVAL}" |activity=${ACTIVITY}"
                        ;;
        esac
        exit 0
else
        echo "CRITICAL - Node is unreachable|state=0"
        exit 2
fi
