#!/bin/bash
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

#e.g. cp -R /tmp/com.hfghe.gdgh/shared_prefs/mybank.xml ./xml_C2

cpR="cp -R "
move_mybank="/shared_prefs/mybank.xml ./Mybank_C2/"
move_pref="/shared_prefs/pref.xml ./Mybank_C2/"
path_mybank="/shared_prefs/mybank.xml"
path_pref="/shared_prefs/pref.xml"
cmd_mybank="$cpR$tmp1$pkg$move_mybank$pkg"
cmd_pref="$cpR$tmp1$pkg$move_pref$pkg"


if [ -f "$tmp1$pkg$path_mybank" ]
then
	echo "$path_mybank is exists"
	$cmd_mybank
elif [ -f "$tmp1$pkg$path_pref" ]
then
	echo "$path_pref is exists"
	$cmd_pref
else
	echo "No match file exist!"
fi
		

