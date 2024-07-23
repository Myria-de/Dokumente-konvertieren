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
