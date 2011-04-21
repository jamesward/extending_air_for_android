#!/bin/sh
rm -r bin
mkdir bin
/home/jamesw/flex_sdk_4.5.0.19786-air_sdk_2.6.0.19120/bin/mxmlc -load-config /home/jamesw/flex_sdk_4.5.0.19786-air_sdk_2.6.0.19120/frameworks/air-config.xml -output bin/app.swf src/app.mxml
/home/jamesw/flex_sdk_4.5.0.19786-air_sdk_2.6.0.19120/bin/adt -package -target apk-debug -storetype pkcs12 -keystore a.p12 -storepass a bin/app.apk app.xml -C bin app.swf
/home/jamesw/android/dex2jar-0.0.7.9-SNAPSHOT/dex2jar.sh bin/app.apk
mkdir bin/tmp
cd bin/tmp
jar -xvf ../app.apk.dex2jar.jar
rm -r air/app/R*
jar -cvf ../airbootstap.jar .
cd ..
rm -r tmp
zip extending_air_for_android.zip airbootstap.jar
cd ../apk-res
zip -gr ../bin/extending_air_for_android.zip .
