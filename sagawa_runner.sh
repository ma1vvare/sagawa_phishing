sh ADB_pkgName.sh
sh ADB_push.sh
sh ADB_launchAPP.sh
sleep 10
sh ADB_extractDex.sh
sh ADB_pull_xml.sh

rm -f ADB_launchAPP.sh
rm -f ADB_extractDex.sh