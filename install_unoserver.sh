#!/usr/bin/env bash
echo "Prüfe Voraussetzungen..."
if [ ! -d /usr/share/doc/python3-venv ]
 then
 echo "Installiere pip3" 
 sudo apt python3-venv
else
 echo OK: python3-venv
fi

if [ -z $(which pip3) ]
then
 echo "Installiere pip3"
 sudo apt-get -y install git
else
 echo OK: pip3
fi
cd ~
echo Installiere unoserver in ~/.unoserver
python3 -m venv ./.unoserver
. ./.unoserver/bin/activate
pip3 install oooenv
oooenv cmd-link -a
pip3 install unoserver
deactivate

echo Erzeuge Start/Stop-Script
cat<<EOF>~/.unoserver/bin/start-unoserver.sh
~/.unoserver/bin/unoserver --daemon -p ~/.unoserver/lo.pid
ps ax | grep ".unoserver/bin/unoserver" | grep -v grep|cut -c 1-8 | sed "s/ *$//g" | sed "s/^ *//g"> ~/.unoserver/unoserver.pid
EOF
cat<<EOF>~/.unoserver/bin/stop-unoserver.sh
/usr/bin/pkill -F ~/.unoserver/unoserver.pid && rm ~/.unoserver/unoserver.pid
EOF
chmod a+x ~/.unoserver/bin/start-unoserver.sh
chmod a+x ~/.unoserver/bin/stop-unoserver.sh

echo Bitte fügen Sie ~/.unoserver/bin in der Datei .profile
echo zur Umgebungsvariablen PATH hinzu

