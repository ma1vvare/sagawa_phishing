
strings manifest.xml | grep package | cut -d = -f2 | tr -d '"'
pkg=$(strings manifest.xml | grep package | cut -d = -f2 | tr -d '"')

#pull .dex file from android device to PC's folder
#e.g. adb pull /tmp/com.hfghe.gdgh /tmp
adb="adb pull "
tmp1="/tmp/"
space=" /"
tmp2="tmp"
cmd="$adb$tmp1$pkg$space$tmp2"
$cmd

#cp /tmp/com.hfghe.gdgh/files ~/Desktop/
#e.g. cp -R /tmp/com.hfghe.gdgh/files/a ./dexFile
cpR="cp -R "
files="/files/a ./dexFile"
cmd="$cpR$tmp1$pkg$files"
$cmd

#remove related file
#rm -f manifest.xml