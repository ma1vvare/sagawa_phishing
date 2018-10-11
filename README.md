@ sagawa_runner.sh (安裝並啟動APP)
——————————————————————————
1.取出APK的pkg及activity name
2.寫出ADB_extractDex.sh
2.將APK及ADB_extractDex.sh傳至模擬器中
3.自動執行APP
4.將dex檔從模擬器拉出來到本機端
5.將包含C2資訊的mybank.xml或者prefs.xml拉出來
——————————————————————————
所需檔案：
1.ADB_pkgName.sh
2.ADB_push.sh
3.ADB_launchAPP.sh
4.ADB_extractDex.sh
5.ADB_pull_xml.sh
——————————————————————————
使用方式：
sh sagawa_runner.sh

——————————————————————————

@ decrypt_libxxn_nini.sh (惡意程式分析)
——————————————————————————
1.從 libxxn.so 取出AES金鑰 
2.使用此金鑰解密 nini.dll 檔
  產出惡意程式主體 class.dex
3.從 class.dex中取出 DES密文
  此密文為16進制值，並解密
——————————————————————————
所需檔案：
1.惡意APK
2.libxxn.so
3.nini.dll
4.decode_nini.py
5.decrypt_DES_ip.py
——————————————————————————
使用方式：
sh decrypt_libxxn_nini.sh
——————————————————————————










