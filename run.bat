set BIN="c:\Program Files\Saxonica\SaxonHE9.7N\bin"

%BIN%\Transform.exe -s:datain\herefordshire-latest.osm -xsl:osm-addr.xslt -o:temp\herefordshire-reform.xml
%BIN%\Transform.exe -s:temp\herefordshire-reform.xml -xsl:createFreeForm.xslt -o:dataout\herefordshire.xml
