#!/bin/bash
#change .apk to .zip
mv ./apk/sagawa_1011.apk ./apk/sagawa_1011.zip

#uzip zip then extract AndroidManifest.xml
unzip -p ./apk/sagawa_1011.zip AndroidManifest.xml > AndroidManifest.xml

#return .zip to .apk
mv ./apk/sagawa_1011.zip ./apk/sagawa_1011.apk 

#decomplie AndroidManifest.xml by using "AXMLPrinter2.jar"
java -jar AXMLPrinter2.jar AndroidManifest.xml > manifest.xml


#grep package name from xml, get pkg name like "com.xxx.xxx"
strings manifest.xml | grep package | cut -d = -f2 | tr -d '"'
pkg=$(strings manifest.xml | grep package | cut -d = -f2 | tr -d '"')

adb_shell="adb shell "
cpR="cp -R "
dataData="/data/data/"
dataTmp="/data/tmp/"
tmp="/tmp/"
space=" "

#write ADB_extractDex.sh file commands
#cp -R /data/data/pkg /data/tmp/
cmd="$adb_shell$cpR$dataData$pkg$space$dataTmp"

echo $cmd >> ADB_extractDex.sh
#cp -R /data/tmp/pkg /tmp/
cmd="$adb_shell$cpR$dataTmp$pkg$space$tmp"
echo $cmd >> ADB_extractDex.sh
echo "chmod -R 777 /tmp" >> ADB_extractDex.sh
echo "exit" >> ADB_extractDex.sh

#write ADB_launchAPP.sh file commands
#adb shell am start -n [package_name]/[activity_name]
echo "000"
activities=$(xmlstarlet sel -t -m '/manifest/application/activity' -v "concat(@android:name,'')" -n manifest.xml | cut -d ' ' -f 1)
activity=$(echo $activities | cut -d ' ' -f1)
echo $activity

adb_shell_start="adb shell am start -n "
line="/"
cmd="$adb_shell_start$pkg$line$activity"
echo $cmd >> ADB_launchAPP.sh
#remove related files
rm -f AndroidManifest.xml

