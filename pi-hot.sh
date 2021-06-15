# Variable
max_temp="100"
warn_temp="60"
webhooks_url=""
shutdowncmd="poweroff"
temp="$(vcgencmd measure_temp | egrep -o '[0-9]*\.[0-9]*')"
ip="$(curl -s https://api.ipify.org)"

# Programme

if (( $(echo "$temp >= $max_temp" |bc -l) )); then
    curl -H "Content-Type: application/json" -X POST -d '{"content":"'"J'ai trop chaud ! \nMa température est de : $temp °C. \nJe me mets et sécurité et arrêté tous mes systèmes !"'"}' $webhooks_url

elif (( $(echo "$temp >= $warn_temp" |bc -l) )); then
    curl -H "Content-Type: application/json" -X POST -d '{"content":"'"J'ai chaud ! \nMa température est de : $temp °C. \nMon ip est : $ip"'"}' $webhooks_url
fi

echo "RAS"

exit 0