## Was steckt in einer Office-Datei?
file Dokument.odt

## Libre-Office-Dateien im Terminal konvertieren

```soffice --convert-to pdf *.odt```

```soffice --convert-to odt *.docx```

```soffice --convert-to xlsx Dateiname.ods```

```soffice --convert-to 'pdf:writer_pdf_Export:{"PageRange":{"type":"string","value":"1-2"}}' Test.odt```

```sudo apt install libreoffice-java-common```

## Libre Office als Server starten

```sh ~/Downloads/install_unoserver.sh```

```PATH="$HOME/.unoserver/bin:$PATH"```

```source ~/.profile```

```start-unoserver.sh```

```stop-unoserver.sh```

```unoconvert [Quelldatei] [Zieldatei]```

```unoconvert --filter-option PageRange=1-1 Test.odt Test.pdf```

## Unoserver im lokalen Netzwerk verwenden

```--interface 0.0.0.0```

```ExecStart=/usr/bin/bash -c 'cd $HOME/.unoserver/bin; ./python ./unoserver --interface 0.0.0.0;'```

```
sudo systemctl daemon-reload
sudo systemctl enable unoserver
sudo systemctl start unoserver
```

```unoconvert --host [IP] --host-location remote Test.odt Test.pdf```

```unoconvert --filter-option PageRange=1-1 --filter-option EncryptFile=true --filter-option DocumentOpenPassword=geheim Test.odt Test.pdf```


## Dokumente ohne Libre Office konvertieren
**Pandoc:** https://pandoc.org

**Pdf2htmlEX:** https://github.com/pdf2htmlex/pdf2htmlex

**Ocrmypdf:** https://github.com/ocrmypdf/ocrmypdf

```sudo apt install pandoc```

```pandoc -o test.docx test.odt```

```pandoc --extract-media="./" -t mediawiki -o test.md test.odt```

```pdf2htmlEX [Quelldatei.pdf] [Zieldatei.html]```

```
sudo apt install tesseract-ocr tesseract-ocr-deu pipx unpaper
pipx install ocrmypdf 
source ~/.profile
```

```ocrmypdf -l deu [Quelldatei.pdf] [Zieldatei.pdf]```

