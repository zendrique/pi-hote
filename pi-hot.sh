# Variable
max_temp="100"
warn_temp="60"
webhooks_url=""
shutdowncmd="poweroff"
temp="$(vcgencmd measure_temp | egrep -o '[0-9]*\.[0-9]*')"
arg=$1

function getip {
    ip=$(curl -s https://api.ipify.org)
}

# Programme
if [ "$1" = "--manual" ] ; then
    getip
    curl -H "Content-Type: application/json" -d '{"username": "Raspberry Pi", "content": "'"Demande de vérification manuelle \nMa température est de : $temp °C."'"}' $webhooks_url
elif (( $(echo "$temp >= $max_temp" |bc -l) )); then
    getip
    curl -H "Content-Type: application/json" -d '{"username": "Raspberry Pi", "content": "'"J'ai trop chaud ! \nMa température est de : $temp °C. \nJe me mets et sécurité et arrêté tous mes systèmes !"'"}' $webhooks_url

elif (( $(echo "$temp >= $warn_temp" |bc -l) )); then
    getip
    curl -H "Content-Type: application/json" -d '{"username": "Raspberry Pi", "content": "'"J'ai chaud ! \nMa température est de : $temp °C. \nMon ip est : $ip"'"}' $webhooks_url
else
    echo "[PI-HOT] : RAS"
fi

exit 0