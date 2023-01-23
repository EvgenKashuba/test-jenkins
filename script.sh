hostname
cat << EOF > script.sh
#!/bin/bash
FILENAME="log"
CHOICE=\$1
case \$CHOICE in
  "Jan" )
   journalctl -p err | grep "\$CHOICE" > \$FILENAME-\$CHOICE-Error-\`date +%b\-%d\-%Y\-%T\` ;;
  "Dec" )
   journalctl -p err | grep "\$CHOICE" > \$FILENAME-\$CHOICE-Error-\`date +%b\-%d\-%Y\-%T\` ;;
  "Nov" )
   journalctl -p err | grep "\$CHOICE" > \$FILENAME-\$CHOICE-Error-\`date +%b\-%d\-%Y\-%T\` ;;
  * )
   journalctl -p err | tail -n 20 > \$FILENAME-Err-last20-\`date +%b\-%d\-%Y\-%T\`
   CHOICE="this month (last 20)" 
   touch test ;;
esac
echo "ErrorLogs in \$CHOICE add in \$FILENAME succesful!"
EOF
bash script.sh
