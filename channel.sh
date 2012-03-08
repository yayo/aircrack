if [ $# -ne 2 -o ${2} -lt 1 -o ${2} -gt 14 ]
then
echo Usage: ${0} interface channel
else
BSSID=" bssid "
while [ "${CHAN}" != " chan ${2}${BSSID}" ]
do
ifconfig ${1} media autoselect
sleep 1
ifconfig ${1} mediaopt monitor
CHAN=""
while [ -z "${CHAN}" ]
do
CHAN=$(ifconfig ${1} | sed -ne "s/.*\( chan [[:digit:]]*${BSSID}\).*/\1/p")
done
echo ${CHAN}
done
fi
