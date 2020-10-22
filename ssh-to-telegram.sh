# save to /etc/profile.d/ssh-to-telegram.sh
USERID=""
KEY=""
TIMEOUT="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"
DATE_EXEC="$(date "+%d %b %Y %H:%M")"
TMPFILE="/tmp/ip-info.txt"
if [ -n "$SSH_CLIENT" ]; then
        IP=$(awk '{print $1}' <<< $SSH_CLIENT)
        PORT=$(awk '{print $3}' <<< $SSH_CLIENT)
        HOSTNAME=$(hostname -f)
        IPADDR=$(hostname -I | awk '{print $1}')
        curl http://ipinfo.io/$IP -s -o $TMPFILE
        CITY=$(jq -r '.city' < $TMPFILE)
        REGION=$(cat $TMPFILE | jq '.region' | sed 's/"//g')
        COUNTRY=$(cat $TMPFILE | jq '.country' | sed 's/"//g')
        ORG=$(cat $TMPFILE | jq '.org' | sed 's/"//g')
        TEXT="$DATE_EXEC: Enter ${USER} by ssh on ${HOSTNAME} from $IP - $ORG - $CITY, $REGION, $COUNTRY"
        curl -s --max-time $TIMEOUT -d "chat_id=$USERID&disable_web_page_preview=1&text=$TEXT" $URL > /dev/null
        rm "$TMPFILE"
fi
