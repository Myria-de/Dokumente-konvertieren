#!/usr/bin/env bash
echo "Prüfe Voraussetzungen..."
if [ -z $(which pip3) ]
then
 echo "Installiere pip3"
 sudo apt -y install python3-pip
else
 echo OK: pip3 vorhanden
fi

if [ -z $(which virtualenv) ]
then
 echo "Installiere virtualenv "
 sudo apt -y install python3-virtualenv 
else
 echo OK: virtualenv vorhanden
fi
cd ~
echo Installiere unoserver in ~/.unoserver
virtualenv --python=/usr/bin/python3 --system-site-packages ~/.unoserver
~/.unoserver/bin/pip install unoserver

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
echo zur Umgebungsvariablen PATH hinzu. Verwenden Sie die Zeile
echo
echo 'export PATH="$HOME/.unoserver/bin:$PATH"'
echo
echo Danach starten Sie source ~/.profile, damit die Anpassung für das aktuelle Terminal gilt.
echo Nach einem Linux-Neustart gilt sie für alle Terminals.

