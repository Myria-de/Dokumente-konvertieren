# Dokumente-konvertieren
Dokumente mit Libre Office konvertieren

# Libre Office im Terminal steuern
```
soffice --convert-to pdf Test.odt 
```
```
soffice --convert-to pdf ~/Dokumente/ODT/*.odt --outdir ~/Dokumente/PDF
```
```
soffice --convert-to 'pdf:writer_pdf_Export:{"PageRange":{"type":"string","value":"1-2"}}' Test.odt
```
```
soffice --convert-to 'pdf:writer_pdf_Export:{"EncryptFile":{"type":"boolean","value":"true"},"DocumentOpenPassword":{"type":"string","value":"geheim"}}' Test.odt
```
```
soffice --convert-to html Test.pdf
```
*Hinweis:* Wenn Libre Office die Meldung „Warning: failed to launch javaldx - java may not function correctly“ ausgibt, schränkt das die Funktionen nicht ein. Java wird zu diesem Zweck nicht benötigt. Sollte Sie die Meldung stören, aktivieren Sie die Java-Unterstützung mit
```
sudo apt install libreoffice-java-common
```
# Libre Office als Server starten
Das Projekt Unoserver (https://github.com/unoconv/unoserver) erleichtert die Verwendung. Es ist der verbesserte Nachfolger von Unoconv, das als veraltet gilt, aber meist noch in den Paketquellen der Distributionen zu finden ist.

Die Installation des Python-Projekts erfolgt am sichersten in einer virtuellen Python-Umgebung. Das erfordert mehrere Schritte, weshalb wir dafür das Bash-Script "install-unoserver.sh" für Ubuntu 22.04/24.04 und Linux Mint 21.3 zur Verfügung stellen. Laden Sie die Datei herunter und starten Sie das Script im Terminal mit
```
sh ~/Downloads/install_unoserver.sh
```
Wenn noch nicht vorhanden, werden die Pakete „python3-venv“ und „pip3“ installiert, wofür Sie die Erlaubnis mit Ihrem Passwort erteilen. Die Python-Installation im Order „~/.unoserver“ erfolgt mit den Rechten des Benutzers. Neben dem Python-Paket „unoserver“ installiert das Script „oooenv“ (https://pypi.org/project/oooenv), das den Zugriff auf die Python-Systembibliotheken „uno.py“ und „unohelper.py“ in der virtuellen Umgebung ermöglicht. Fügen Sie die Zeile
```
PATH="$HOME/.unoserver/bin:$PATH"
```
am Ende in die Datei „.profile“ (im Dateimanager einblenden mit Strg-H) in Ihrem Homeverzeichnis ein und melden Sie sich bei Linux ab und wieder an. Unoserver lässt sich dann im Terminal ohne Angabe des Installationspfades mit 
```
start-unoserver.sh
```
starten und mit 
```
stop-unoserver.sh
```
wieder beenden.

**Dateien konvertieren:** Wenn der Server läuft, lässt sich eine einzelne Datei mit
```
unoconvert [Quelldatei] [Zieldatei]
```
konvertieren. Anhand der Dateinamenserweiterung bestimmt das Tool den passenden Exportfilter. Um beispielsweise nur die erste Seite eines Writer-Dokuments in eine PDF-Datei zu konvertieren, verwenden Sie 
```
unoconvert --filter-option PageRange=1-1 Test.odt Test.pdf
```
Für weitere Optionen benutzen Sie „--filter-option“ mehrfach, beispielsweise
```
unoconvert --filter-option PageRange=1-1 --filter-option EncryptFile=true --filter-option DocumentOpenPassword=geheim Test.odt Test.pdf
```
für eine verschlüsselte PDF-Datei mit Passwortschutz. Unoconvert kann Optionen für PDF auch mit älteren Libre-Office-Versionen verwenden, weil über den Server-Modus die API direkt angesprochen wird.
