MODEM=/dev/ttyUSB2
NUMBER=$1
shift 1
TEXT=$*

echo -e -n "AT+CMGF=1 \015" > $MODEM
echo -e -n "AT+CMGS=\"$NUMBER\" \015" > $MODEM
echo -e -n "$TEXT \015" | cut -c1-150 | tr -d '\n' > $MODEM
echo -e -n "\032" > $MODEM
echo To: $NUMBER
echo Text: $TEXT
echo SMS sent.
