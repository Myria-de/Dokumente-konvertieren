#!/usr/bin/env bash
PYTHON="$HOME/LO_26.8.2/install/opt/libreoffice26.8/program/python"
PYTHON_BIN="$HOME/LO_26.8.2/install/opt/libreoffice26.8/program/python-core-3.13.17/bin"
echo "Prüfe Voraussetzungen..."

module="uno"
if $PYTHON -c "import importlib; from importlib import util; exit(1 if importlib.util.find_spec(\"$module\") else 0)"; then
 echo "Python Uno ist nicht vorhanden"
 echo "Stimmt der Pfad zu Libre Office? Abbruch."
 exit 1
else
  echo OK: uno ist vorhanden
fi

module="pip"
if $PYTHON -c "import importlib; from importlib import util; exit(1 if importlib.util.find_spec(\"$module\") else 0)"; then
 echo "Installiere pip"
 wget https://bootstrap.pypa.io/get-pip.py
 $PYTHON get-pip.py
else
 echo OK: $module ist vorhanden
fi

echo Installiere unoserver
$PYTHON -m pip install unoserver
cd $PYTHON_BIN
# Shebang ersetzen, damit er auch python statt auf python.bin zeigt
find . -type f -name '*' -exec sed -i '1 s!python.bin!python!' {} +

# cd ~
cd $PYTHON_BIN
echo Erzeuge Start/Stop-Script
cat<<EOF>start-unoserver.sh
./unoserver --daemon -p lo.pid
ps ax | grep "./unoserver" | grep -v grep|cut -c 1-8 | sed "s/ *$//g" | sed "s/^ *//g"> unoserver.pid
EOF

cat<<EOF>stop-unoserver.sh
/usr/bin/pkill -F unoserver.pid && rm unoserver.pid
EOF
chmod a+x start-unoserver.sh
chmod a+x stop-unoserver.sh

echo Bitte fügen Sie $PYTHON_BIN in der Datei .profile
echo zur Umgebungsvariablen PATH hinzu. Verwenden Sie die Zeile
echo
echo 'export PATH="$HOME/$PYTHON_BIN/bin:$PATH"'
echo
echo Danach starten Sie source ~/.profile, damit die Anpassung für das aktuelle Terminal gilt.
echo Nach einem Linux-Neustart gilt dike Anpassung für alle Terminals.


