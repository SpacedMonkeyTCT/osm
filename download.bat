set ZIP="http://download.geofabrik.de/europe/great-britain/england/herefordshire-latest.osm.bz2"

powershell.exe -Command (new-object System.Net.WebClient).DownloadFile('%ZIP%', 'datain/herefordshire-latest.osm.bz2')
"C:\Program Files\7-Zip\7z.exe" x -y -odatain datain/herefordshire-latest.osm.bz2
