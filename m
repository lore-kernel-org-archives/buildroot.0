From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Wed, 7 Aug 2013 19:38:37 +0200
Subject: [Buildroot] qt 5.02 not building
In-Reply-To: <20130807171137.3aa6865a@skate>
References: <77698A93A9334B5FBD062F0FE17E67D4@JohanW7>
 <20130807171137.3aa6865a@skate>
Message-ID: <07AC286795CB4F4B8C7523D9ECE6109A@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Dear

Here are the last few hundred lines of the build :
See near the end of this message.

_QMAKE -DQT_BOOTSTRAPPED -DPROEVALUATOR_FULL -DPROEVALUATOR_DEBUG -DQT_NO_TEXTCODEC -DQT_NO_UNICODETABLES -DQT_NO_COMPONENT
-DQT_NO_COMPRESS -DQT_NO_THREAD -DQT_NO_QOBJECT -DQT_NO_GEOM_VARIANT -DQT_NO_DATASTREAM
/home/buildroot12git/output/build/qt5base-5.0.2/src/corelib/kernel/qmetatype.cpp
g++ -c -o qsettings.o -pipe -DQMAKE_OPENSOURCE_EDITION -O2 -g  -I/home/buildroot12git/output/build/qt5base-5.0.2/qmake
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/library -I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/unix
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/win32
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/mac
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/integrity
-I/home/buildroot12git/output/build/qt5base-5.0.2/include -I/home/buildroot12git/output/build/qt5base-5.0.2/include/QtCore
-I/home/buildroot12git/output/build/qt5base-5.0.2/include/QtCore/5.0.2
-I/home/buildroot12git/output/build/qt5base-5.0.2/include/QtCore/5.0.2/QtCore
-I/home/buildroot12git/output/build/qt5base-5.0.2/src/corelib/global -DHAVE_QCONFIG_CPP
-I/home/buildroot12git/output/build/qt5base-5.0.2/mkspecs/linux-g++ -I/home/buildroot12git/output/build/qt5base-5.0.2/tools/shared
-DQT_BUILD_QMAKE -DQT_BOOTSTRAPPED -DPROEVALUATOR_FULL -DPROEVALUATOR_DEBUG -DQT_NO_TEXTCODEC -DQT_NO_UNICODETABLES
-DQT_NO_COMPONENT -DQT_NO_COMPRESS -DQT_NO_THREAD -DQT_NO_QOBJECT -DQT_NO_GEOM_VARIANT -DQT_NO_DATASTREAM
/home/buildroot12git/output/build/qt5base-5.0.2/src/corelib/io/qsettings.cpp
g++ -c -o qsystemerror.o -pipe -DQMAKE_OPENSOURCE_EDITION -O2 -g  -I/home/buildroot12git/output/build/qt5base-5.0.2/qmake
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/library -I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/unix
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/win32
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/mac
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/integrity
-I/home/buildroot12git/output/build/qt5base-5.0.2/include -I/home/buildroot12git/output/build/qt5base-5.0.2/include/QtCore
-I/home/buildroot12git/output/build/qt5base-5.0.2/include/QtCore/5.0.2
-I/home/buildroot12git/output/build/qt5base-5.0.2/include/QtCore/5.0.2/QtCore
-I/home/buildroot12git/output/build/qt5base-5.0.2/src/corelib/global -DHAVE_QCONFIG_CPP
-I/home/buildroot12git/output/build/qt5base-5.0.2/mkspecs/linux-g++ -I/home/buildroot12git/output/build/qt5base-5.0.2/tools/shared
-DQT_BUILD_QMAKE -DQT_BOOTSTRAPPED -DPROEVALUATOR_FULL -DPROEVALUATOR_DEBUG -DQT_NO_TEXTCODEC -DQT_NO_UNICODETABLES
-DQT_NO_COMPONENT -DQT_NO_COMPRESS -DQT_NO_THREAD -DQT_NO_QOBJECT -DQT_NO_GEOM_VARIANT -DQT_NO_DATASTREAM
/home/buildroot12git/output/build/qt5base-5.0.2/src/corelib/kernel/qsystemerror.cpp
g++ -c -o qlibraryinfo.o -pipe -DQMAKE_OPENSOURCE_EDITION -O2 -g  -I/home/buildroot12git/output/build/qt5base-5.0.2/qmake
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/library -I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/unix
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/win32
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/mac
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/integrity
-I/home/buildroot12git/output/build/qt5base-5.0.2/include -I/home/buildroot12git/output/build/qt5base-5.0.2/include/QtCore
-I/home/buildroot12git/output/build/qt5base-5.0.2/include/QtCore/5.0.2
-I/home/buildroot12git/output/build/qt5base-5.0.2/include/QtCore/5.0.2/QtCore
-I/home/buildroot12git/output/build/qt5base-5.0.2/src/corelib/global -DHAVE_QCONFIG_CPP
-I/home/buildroot12git/output/build/qt5base-5.0.2/mkspecs/linux-g++ -I/home/buildroot12git/output/build/qt5base-5.0.2/tools/shared
-DQT_BUILD_QMAKE -DQT_BOOTSTRAPPED -DPROEVALUATOR_FULL -DPROEVALUATOR_DEBUG -DQT_NO_TEXTCODEC -DQT_NO_UNICODETABLES
-DQT_NO_COMPONENT -DQT_NO_COMPRESS -DQT_NO_THREAD -DQT_NO_QOBJECT -DQT_NO_GEOM_VARIANT -DQT_NO_DATASTREAM
/home/buildroot12git/output/build/qt5base-5.0.2/src/corelib/global/qlibraryinfo.cpp
g++ -c -o qvariant.o -pipe -DQMAKE_OPENSOURCE_EDITION -O2 -g  -I/home/buildroot12git/output/build/qt5base-5.0.2/qmake
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/library -I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/unix
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/win32
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/mac
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/integrity
-I/home/buildroot12git/output/build/qt5base-5.0.2/include -I/home/buildroot12git/output/build/qt5base-5.0.2/include/QtCore
-I/home/buildroot12git/output/build/qt5base-5.0.2/include/QtCore/5.0.2
-I/home/buildroot12git/output/build/qt5base-5.0.2/include/QtCore/5.0.2/QtCore
-I/home/buildroot12git/output/build/qt5base-5.0.2/src/corelib/global -DHAVE_QCONFIG_CPP
-I/home/buildroot12git/output/build/qt5base-5.0.2/mkspecs/linux-g++ -I/home/buildroot12git/output/build/qt5base-5.0.2/tools/shared
-DQT_BUILD_QMAKE -DQT_BOOTSTRAPPED -DPROEVALUATOR_FULL -DPROEVALUATOR_DEBUG -DQT_NO_TEXTCODEC -DQT_NO_UNICODETABLES
-DQT_NO_COMPONENT -DQT_NO_COMPRESS -DQT_NO_THREAD -DQT_NO_QOBJECT -DQT_NO_GEOM_VARIANT -DQT_NO_DATASTREAM
/home/buildroot12git/output/build/qt5base-5.0.2/src/corelib/kernel/qvariant.cpp
g++ -c -o qvsnprintf.o -pipe -DQMAKE_OPENSOURCE_EDITION -O2 -g  -I/home/buildroot12git/output/build/qt5base-5.0.2/qmake
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/library -I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/unix
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/win32
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/mac
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/integrity
-I/home/buildroot12git/output/build/qt5base-5.0.2/include -I/home/buildroot12git/output/build/qt5base-5.0.2/include/QtCore
-I/home/buildroot12git/output/build/qt5base-5.0.2/include/QtCore/5.0.2
-I/home/buildroot12git/output/build/qt5base-5.0.2/include/QtCore/5.0.2/QtCore
-I/home/buildroot12git/output/build/qt5base-5.0.2/src/corelib/global -DHAVE_QCONFIG_CPP
-I/home/buildroot12git/output/build/qt5base-5.0.2/mkspecs/linux-g++ -I/home/buildroot12git/output/build/qt5base-5.0.2/tools/shared
-DQT_BUILD_QMAKE -DQT_BOOTSTRAPPED -DPROEVALUATOR_FULL -DPROEVALUATOR_DEBUG -DQT_NO_TEXTCODEC -DQT_NO_UNICODETABLES
-DQT_NO_COMPONENT -DQT_NO_COMPRESS -DQT_NO_THREAD -DQT_NO_QOBJECT -DQT_NO_GEOM_VARIANT -DQT_NO_DATASTREAM
/home/buildroot12git/output/build/qt5base-5.0.2/src/corelib/tools/qvsnprintf.cpp
g++ -c -o qlocale.o -pipe -DQMAKE_OPENSOURCE_EDITION -O2 -g  -I/home/buildroot12git/output/build/qt5base-5.0.2/qmake
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/library -I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/unix
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/win32
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/mac
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/integrity
-I/home/buildroot12git/output/build/qt5base-5.0.2/include -I/home/buildroot12git/output/build/qt5base-5.0.2/include/QtCore
-I/home/buildroot12git/output/build/qt5base-5.0.2/include/QtCore/5.0.2
-I/home/buildroot12git/output/build/qt5base-5.0.2/include/QtCore/5.0.2/QtCore
-I/home/buildroot12git/output/build/qt5base-5.0.2/src/corelib/global -DHAVE_QCONFIG_CPP
-I/home/buildroot12git/output/build/qt5base-5.0.2/mkspecs/linux-g++ -I/home/buildroot12git/output/build/qt5base-5.0.2/tools/shared
-DQT_BUILD_QMAKE -DQT_BOOTSTRAPPED -DPROEVALUATOR_FULL -DPROEVALUATOR_DEBUG -DQT_NO_TEXTCODEC -DQT_NO_UNICODETABLES
-DQT_NO_COMPONENT -DQT_NO_COMPRESS -DQT_NO_THREAD -DQT_NO_QOBJECT -DQT_NO_GEOM_VARIANT -DQT_NO_DATASTREAM
/home/buildroot12git/output/build/qt5base-5.0.2/src/corelib/tools/qlocale.cpp
g++ -c -o qlocale_tools.o -pipe -DQMAKE_OPENSOURCE_EDITION -O2 -g  -I/home/buildroot12git/output/build/qt5base-5.0.2/qmake
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/library -I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/unix
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/win32
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/mac
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/integrity
-I/home/buildroot12git/output/build/qt5base-5.0.2/include -I/home/buildroot12git/output/build/qt5base-5.0.2/include/QtCore
-I/home/buildroot12git/output/build/qt5base-5.0.2/include/QtCore/5.0.2
-I/home/buildroot12git/output/build/qt5base-5.0.2/include/QtCore/5.0.2/QtCore
-I/home/buildroot12git/output/build/qt5base-5.0.2/src/corelib/global -DHAVE_QCONFIG_CPP
-I/home/buildroot12git/output/build/qt5base-5.0.2/mkspecs/linux-g++ -I/home/buildroot12git/output/build/qt5base-5.0.2/tools/shared
-DQT_BUILD_QMAKE -DQT_BOOTSTRAPPED -DPROEVALUATOR_FULL -DPROEVALUATOR_DEBUG -DQT_NO_TEXTCODEC -DQT_NO_UNICODETABLES
-DQT_NO_COMPONENT -DQT_NO_COMPRESS -DQT_NO_THREAD -DQT_NO_QOBJECT -DQT_NO_GEOM_VARIANT -DQT_NO_DATASTREAM
/home/buildroot12git/output/build/qt5base-5.0.2/src/corelib/tools/qlocale_tools.cpp
g++ -c -o qlocale_unix.o -pipe -DQMAKE_OPENSOURCE_EDITION -O2 -g  -I/home/buildroot12git/output/build/qt5base-5.0.2/qmake
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/library -I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/unix
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/win32
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/mac
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/integrity
-I/home/buildroot12git/output/build/qt5base-5.0.2/include -I/home/buildroot12git/output/build/qt5base-5.0.2/include/QtCore
-I/home/buildroot12git/output/build/qt5base-5.0.2/include/QtCore/5.0.2
-I/home/buildroot12git/output/build/qt5base-5.0.2/include/QtCore/5.0.2/QtCore
-I/home/buildroot12git/output/build/qt5base-5.0.2/src/corelib/global -DHAVE_QCONFIG_CPP
-I/home/buildroot12git/output/build/qt5base-5.0.2/mkspecs/linux-g++ -I/home/buildroot12git/output/build/qt5base-5.0.2/tools/shared
-DQT_BUILD_QMAKE -DQT_BOOTSTRAPPED -DPROEVALUATOR_FULL -DPROEVALUATOR_DEBUG -DQT_NO_TEXTCODEC -DQT_NO_UNICODETABLES
-DQT_NO_COMPONENT -DQT_NO_COMPRESS -DQT_NO_THREAD -DQT_NO_QOBJECT -DQT_NO_GEOM_VARIANT -DQT_NO_DATASTREAM
/home/buildroot12git/output/build/qt5base-5.0.2/src/corelib/tools/qlocale_unix.cpp
g++ -c -o qlinkedlist.o -pipe -DQMAKE_OPENSOURCE_EDITION -O2 -g  -I/home/buildroot12git/output/build/qt5base-5.0.2/qmake
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/library -I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/unix
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/win32
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/mac
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/integrity
-I/home/buildroot12git/output/build/qt5base-5.0.2/include -I/home/buildroot12git/output/build/qt5base-5.0.2/include/QtCore
-I/home/buildroot12git/output/build/qt5base-5.0.2/include/QtCore/5.0.2
-I/home/buildroot12git/output/build/qt5base-5.0.2/include/QtCore/5.0.2/QtCore
-I/home/buildroot12git/output/build/qt5base-5.0.2/src/corelib/global -DHAVE_QCONFIG_CPP
-I/home/buildroot12git/output/build/qt5base-5.0.2/mkspecs/linux-g++ -I/home/buildroot12git/output/build/qt5base-5.0.2/tools/shared
-DQT_BUILD_QMAKE -DQT_BOOTSTRAPPED -DPROEVALUATOR_FULL -DPROEVALUATOR_DEBUG -DQT_NO_TEXTCODEC -DQT_NO_UNICODETABLES
-DQT_NO_COMPONENT -DQT_NO_COMPRESS -DQT_NO_THREAD -DQT_NO_QOBJECT -DQT_NO_GEOM_VARIANT -DQT_NO_DATASTREAM
/home/buildroot12git/output/build/qt5base-5.0.2/src/corelib/tools/qlinkedlist.cpp
g++ -c -o qnumeric.o -pipe -DQMAKE_OPENSOURCE_EDITION -O2 -g  -I/home/buildroot12git/output/build/qt5base-5.0.2/qmake
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/library -I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/unix
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/win32
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/mac
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/integrity
-I/home/buildroot12git/output/build/qt5base-5.0.2/include -I/home/buildroot12git/output/build/qt5base-5.0.2/include/QtCore
-I/home/buildroot12git/output/build/qt5base-5.0.2/include/QtCore/5.0.2
-I/home/buildroot12git/output/build/qt5base-5.0.2/include/QtCore/5.0.2/QtCore
-I/home/buildroot12git/output/build/qt5base-5.0.2/src/corelib/global -DHAVE_QCONFIG_CPP
-I/home/buildroot12git/output/build/qt5base-5.0.2/mkspecs/linux-g++ -I/home/buildroot12git/output/build/qt5base-5.0.2/tools/shared
-DQT_BUILD_QMAKE -DQT_BOOTSTRAPPED -DPROEVALUATOR_FULL -DPROEVALUATOR_DEBUG -DQT_NO_TEXTCODEC -DQT_NO_UNICODETABLES
-DQT_NO_COMPONENT -DQT_NO_COMPRESS -DQT_NO_THREAD -DQT_NO_QOBJECT -DQT_NO_GEOM_VARIANT -DQT_NO_DATASTREAM
/home/buildroot12git/output/build/qt5base-5.0.2/src/corelib/global/qnumeric.cpp
g++ -c -o qcryptographichash.o -pipe -DQMAKE_OPENSOURCE_EDITION -O2 -g  -I/home/buildroot12git/output/build/qt5base-5.0.2/qmake
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/library -I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/unix
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/win32
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/mac
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/integrity
-I/home/buildroot12git/output/build/qt5base-5.0.2/include -I/home/buildroot12git/output/build/qt5base-5.0.2/include/QtCore
-I/home/buildroot12git/output/build/qt5base-5.0.2/include/QtCore/5.0.2
-I/home/buildroot12git/output/build/qt5base-5.0.2/include/QtCore/5.0.2/QtCore
-I/home/buildroot12git/output/build/qt5base-5.0.2/src/corelib/global -DHAVE_QCONFIG_CPP
-I/home/buildroot12git/output/build/qt5base-5.0.2/mkspecs/linux-g++ -I/home/buildroot12git/output/build/qt5base-5.0.2/tools/shared
-DQT_BUILD_QMAKE -DQT_BOOTSTRAPPED -DPROEVALUATOR_FULL -DPROEVALUATOR_DEBUG -DQT_NO_TEXTCODEC -DQT_NO_UNICODETABLES
-DQT_NO_COMPONENT -DQT_NO_COMPRESS -DQT_NO_THREAD -DQT_NO_QOBJECT -DQT_NO_GEOM_VARIANT -DQT_NO_DATASTREAM
/home/buildroot12git/output/build/qt5base-5.0.2/src/corelib/tools/qcryptographichash.cpp
g++ -c -o qxmlstream.o -pipe -DQMAKE_OPENSOURCE_EDITION -O2 -g  -I/home/buildroot12git/output/build/qt5base-5.0.2/qmake
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/library -I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/unix
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/win32
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/mac
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/integrity
-I/home/buildroot12git/output/build/qt5base-5.0.2/include -I/home/buildroot12git/output/build/qt5base-5.0.2/include/QtCore
-I/home/buildroot12git/output/build/qt5base-5.0.2/include/QtCore/5.0.2
-I/home/buildroot12git/output/build/qt5base-5.0.2/include/QtCore/5.0.2/QtCore
-I/home/buildroot12git/output/build/qt5base-5.0.2/src/corelib/global -DHAVE_QCONFIG_CPP
-I/home/buildroot12git/output/build/qt5base-5.0.2/mkspecs/linux-g++ -I/home/buildroot12git/output/build/qt5base-5.0.2/tools/shared
-DQT_BUILD_QMAKE -DQT_BOOTSTRAPPED -DPROEVALUATOR_FULL -DPROEVALUATOR_DEBUG -DQT_NO_TEXTCODEC -DQT_NO_UNICODETABLES
-DQT_NO_COMPONENT -DQT_NO_COMPRESS -DQT_NO_THREAD -DQT_NO_QOBJECT -DQT_NO_GEOM_VARIANT -DQT_NO_DATASTREAM
/home/buildroot12git/output/build/qt5base-5.0.2/src/corelib/xml/qxmlstream.cpp
g++ -c -o qxmlutils.o -pipe -DQMAKE_OPENSOURCE_EDITION -O2 -g  -I/home/buildroot12git/output/build/qt5base-5.0.2/qmake
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/library -I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/unix
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/win32
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/mac
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/integrity
-I/home/buildroot12git/output/build/qt5base-5.0.2/include -I/home/buildroot12git/output/build/qt5base-5.0.2/include/QtCore
-I/home/buildroot12git/output/build/qt5base-5.0.2/include/QtCore/5.0.2
-I/home/buildroot12git/output/build/qt5base-5.0.2/include/QtCore/5.0.2/QtCore
-I/home/buildroot12git/output/build/qt5base-5.0.2/src/corelib/global -DHAVE_QCONFIG_CPP
-I/home/buildroot12git/output/build/qt5base-5.0.2/mkspecs/linux-g++ -I/home/buildroot12git/output/build/qt5base-5.0.2/tools/shared
-DQT_BUILD_QMAKE -DQT_BOOTSTRAPPED -DPROEVALUATOR_FULL -DPROEVALUATOR_DEBUG -DQT_NO_TEXTCODEC -DQT_NO_UNICODETABLES
-DQT_NO_COMPONENT -DQT_NO_COMPRESS -DQT_NO_THREAD -DQT_NO_QOBJECT -DQT_NO_GEOM_VARIANT -DQT_NO_DATASTREAM
/home/buildroot12git/output/build/qt5base-5.0.2/src/corelib/xml/qxmlutils.cpp
g++ -c -o qlogging.o -pipe -DQMAKE_OPENSOURCE_EDITION -O2 -g  -I/home/buildroot12git/output/build/qt5base-5.0.2/qmake
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/library -I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/unix
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/win32
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/mac
-I/home/buildroot12git/output/build/qt5base-5.0.2/qmake/generators/integrity
-I/home/buildroot12git/output/build/qt5base-5.0.2/include -I/home/buildroot12git/output/build/qt5base-5.0.2/include/QtCore
-I/home/buildroot12git/output/build/qt5base-5.0.2/include/QtCore/5.0.2
-I/home/buildroot12git/output/build/qt5base-5.0.2/include/QtCore/5.0.2/QtCore
-I/home/buildroot12git/output/build/qt5base-5.0.2/src/corelib/global -DHAVE_QCONFIG_CPP
-I/home/buildroot12git/output/build/qt5base-5.0.2/mkspecs/linux-g++ -I/home/buildroot12git/output/build/qt5base-5.0.2/tools/shared
-DQT_BUILD_QMAKE -DQT_BOOTSTRAPPED -DPROEVALUATOR_FULL -DPROEVALUATOR_DEBUG -DQT_NO_TEXTCODEC -DQT_NO_UNICODETABLES
-DQT_NO_COMPONENT -DQT_NO_COMPRESS -DQT_NO_THREAD -DQT_NO_QOBJECT -DQT_NO_GEOM_VARIANT -DQT_NO_DATASTREAM
/home/buildroot12git/output/build/qt5base-5.0.2/src/corelib/global/qlogging.cpp
g++ -o "/home/buildroot12git/output/build/qt5base-5.0.2/bin/qmake" project.o option.o property.o main.o ioutils.o proitems.o
qmakeglobals.o qmakeparser.o qmakeevaluator.o qmakebuiltins.o makefile.o unixmake2.o unixmake.o mingw_make.o winmakefile.o
projectgenerator.o meta.o makefiledeps.o metamakefile.o xmloutput.o pbuilder_pbx.o msvc_vcproj.o msvc_vcxproj.o msvc_nmake.o
msvc_objectmodel.o msbuild_objectmodel.o gbuild.o cesdkhandler.o qtextcodec.o qutfcodec.o qstring.o qstringbuilder.o qtextstream.o
qiodevice.o qmalloc.o qglobal.o qarraydata.o qbytearray.o qbytearraymatcher.o qdatastream.o qbuffer.o qlist.o qfiledevice.o qfile.o
qfilesystementry.o qfilesystemengine_unix.o qfilesystemengine.o qfilesystemiterator_unix.o qfsfileengine_unix.o qfsfileengine.o
qfsfileengine_iterator.o qregexp.o qvector.o qbitarray.o qdir.o qdiriterator.o quuid.o qhash.o qfileinfo.o qdatetime.o qstringlist.o
qabstractfileengine.o qtemporaryfile.o qmap.o qmetatype.o qsettings.o qsystemerror.o qlibraryinfo.o qvariant.o qvsnprintf.o
qlocale.o qlocale_tools.o qlocale_unix.o qlinkedlist.o qnumeric.o qcryptographichash.o qxmlstream.o qxmlutils.o qlogging.o  
make[1]: Leaving directory `/home/buildroot12git/output/build/qt5base-5.0.2/qmake'
Running configuration tests...
Determining architecture... ()
make[1]: Entering directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/arch'
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++ -c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -pipe -Os --sysroot=/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot -g -Wall
-W -fPIE  -I../../mkspecs/devices/linux-buildroot-g++ -I.
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include -o arch.o arch.cpp
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++  -o arch arch.o   -lrt -lpthread -ldl
--sysroot=/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot 
{ test -n "" && DESTDIR="" || DESTDIR=.; } && test $(gdb --version | sed -e 's,[^0-9]\+\([0-9]\)\.\([0-9]\).*,\1\2,;q') -gt 72 &&
gdb --nx --batch --quiet -ex 'set confirm off' -ex "save gdb-index $DESTDIR" -ex quit 'arch' && test -f arch.gdb-index &&
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-objcopy --add-section '.gdb_index=arch.gdb-index'
--set-section-flags '.gdb_index=readonly' 'arch' 'arch' && rm -f arch.gdb-index || true
make[1]: Leaving directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/arch'
    Found architecture in binary
CFG_ARCH="arm"
CFG_CPUFEATURES=" neon"
Determining architecture... ()
make[1]: Entering directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/arch'
g++ -c -pipe -g -Wall -W -fPIE  -I../../mkspecs/linux-g++ -I. -o arch.o arch.cpp
g++  -o arch arch.o    
{ test -n "" && DESTDIR="" || DESTDIR=.; } && test $(gdb --version | sed -e 's,[^0-9]\+\([0-9]\)\.\([0-9]\).*,\1\2,;q') -gt 72 &&
gdb --nx --batch --quiet -ex 'set confirm off' -ex "save gdb-index $DESTDIR" -ex quit 'arch' && test -f arch.gdb-index && objcopy
--add-section '.gdb_index=arch.gdb-index' --set-section-flags '.gdb_index=readonly' 'arch' 'arch' && rm -f arch.gdb-index || true
make[1]: Leaving directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/arch'
    Found architecture in binary
CFG_HOST_ARCH="i386"
CFG_HOST_CPUFEATURES=""
System architecture: 'arm'
Host architecture: 'i386'
floatmath auto-detection... ()
make[1]: Entering directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/unix/floatmath'
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++ -c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -pipe -Os --sysroot=/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot -O2 -O3
-Wall -W -fPIE  -I../../../mkspecs/devices/linux-buildroot-g++ -I.
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include -o floatmath.o floatmath.cpp
floatmath.cpp:44:5: warning: unused parameter 'argc' [-Wunused-parameter]
floatmath.cpp:44:5: warning: unused parameter 'argv' [-Wunused-parameter]
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++ -Wl,-O1 -o floatmath floatmath.o   -lrt -lpthread
-ldl --sysroot=/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot 
make[1]: Leaving directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/unix/floatmath'
floatmath enabled.
sse2 auto-detection... ()
make[1]: Entering directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/common/sse2'
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++ -c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -pipe -Os --sysroot=/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot -msse2 -g
-Wall -W -fPIE  -I../../../mkspecs/devices/linux-buildroot-g++ -I.
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include -o sse2.o sse2.cpp
cc1plus: error: unrecognized command line option '-msse2'
make[1]: *** [sse2.o] Error 1
make[1]: Leaving directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/common/sse2'
sse2 disabled.
sse3 auto-detection... ()
make[1]: Entering directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/common/sse3'
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++ -c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -pipe -Os --sysroot=/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot -msse3 -g
-Wall -W -fPIE  -I../../../mkspecs/devices/linux-buildroot-g++ -I.
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include -o sse3.o sse3.cpp
cc1plus: error: unrecognized command line option '-msse3'
make[1]: *** [sse3.o] Error 1
make[1]: Leaving directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/common/sse3'
sse3 disabled.
ssse3 auto-detection... ()
make[1]: Entering directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/common/ssse3'
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++ -c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -pipe -Os --sysroot=/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot -mssse3 -g
-Wall -W -fPIE  -I../../../mkspecs/devices/linux-buildroot-g++ -I.
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include -o ssse3.o ssse3.cpp
cc1plus: error: unrecognized command line option '-mssse3'
make[1]: *** [ssse3.o] Error 1
make[1]: Leaving directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/common/ssse3'
ssse3 disabled.
sse4_1 auto-detection... ()
make[1]: Entering directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/common/sse4_1'
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++ -c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -pipe -Os --sysroot=/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot -msse4.1
-g -Wall -W -fPIE  -I../../../mkspecs/devices/linux-buildroot-g++ -I.
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include -o sse4_1.o sse4_1.cpp
cc1plus: error: unrecognized command line option '-msse4.1'
make[1]: *** [sse4_1.o] Error 1
make[1]: Leaving directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/common/sse4_1'
sse4_1 disabled.
sse4_2 auto-detection... ()
make[1]: Entering directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/common/sse4_2'
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++ -c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -pipe -Os --sysroot=/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot -msse4.2
-g -Wall -W -fPIE  -I../../../mkspecs/devices/linux-buildroot-g++ -I.
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include -o sse4_2.o sse4_2.cpp
cc1plus: error: unrecognized command line option '-msse4.2'
make[1]: *** [sse4_2.o] Error 1
make[1]: Leaving directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/common/sse4_2'
sse4_2 disabled.
avx auto-detection... ()
make[1]: Entering directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/common/avx'
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++ -c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -pipe -Os --sysroot=/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot -mavx -g
-Wall -W -fPIE  -I../../../mkspecs/devices/linux-buildroot-g++ -I.
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include -o avx.o avx.cpp
cc1plus: error: unrecognized command line option '-mavx'
make[1]: *** [avx.o] Error 1
make[1]: Leaving directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/common/avx'
avx disabled.
neon auto-detection... ()
make[1]: Entering directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/unix/neon'
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++ -c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -pipe -Os --sysroot=/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot -mfpu=neon
-O2 -O3 -Wall -W -fPIE  -I../../../mkspecs/devices/linux-buildroot-g++ -I.
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include -o neon.o neon.cpp
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++ -Wl,-O1 -o neon neon.o   -lrt -lpthread -ldl
--sysroot=/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot 
make[1]: Leaving directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/unix/neon'
neon enabled.
DB2 auto-detection... ()
make[1]: Entering directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/unix/db2'
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++ -c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -pipe -Os --sysroot=/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot -O2 -O3
-Wall -W -fPIE  -I../../../mkspecs/devices/linux-buildroot-g++ -I.
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include -o db2.o db2.cpp
db2.cpp:42:20: fatal error: sqlcli.h: No such file or directory
compilation terminated.
make[1]: *** [db2.o] Error 1
make[1]: Leaving directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/unix/db2'
DB2 disabled.
InterBase auto-detection... ()
make[1]: Entering directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/unix/ibase'
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++ -c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -pipe -Os --sysroot=/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot -O2 -O3
-Wall -W -fPIE  -I../../../mkspecs/devices/linux-buildroot-g++ -I.
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include -o ibase.o ibase.cpp
ibase.cpp:42:19: fatal error: ibase.h: No such file or directory
compilation terminated.
make[1]: *** [ibase.o] Error 1
make[1]: Leaving directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/unix/ibase'
InterBase disabled.
OCI auto-detection... ()
make[1]: Entering directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/unix/oci'
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++ -c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -pipe -Os --sysroot=/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot -O2 -O3
-Wall -W -fPIE  -I../../../mkspecs/devices/linux-buildroot-g++ -I.
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include -o oci.o oci.cpp
oci.cpp:42:17: fatal error: oci.h: No such file or directory
compilation terminated.
make[1]: *** [oci.o] Error 1
make[1]: Leaving directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/unix/oci'
OCI disabled.
ODBC auto-detection... ()
make[1]: Entering directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/unix/odbc'
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++ -c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -pipe -Os --sysroot=/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot -O2 -O3
-Wall -W -fPIE  -I../../../mkspecs/devices/linux-buildroot-g++ -I.
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include -o odbc.o odbc.cpp
odbc.cpp:45:17: fatal error: sql.h: No such file or directory
compilation terminated.
make[1]: *** [odbc.o] Error 1
make[1]: Leaving directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/unix/odbc'
ODBC disabled.
iODBC auto-detection... ()
make[1]: Entering directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/unix/iodbc'
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++ -c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -pipe -Os --sysroot=/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot -O2 -O3
-Wall -W -fPIE  -I../../../mkspecs/devices/linux-buildroot-g++ -I.
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include -o iodbc.o iodbc.cpp
iodbc.cpp:42:17: fatal error: sql.h: No such file or directory
compilation terminated.
make[1]: *** [iodbc.o] Error 1
make[1]: Leaving directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/unix/iodbc'
iODBC disabled.
PostgreSQL auto-detection... ()
make[1]: Entering directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/unix/psql'
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++ -c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -pipe -Os --sysroot=/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot -O2 -O3
-Wall -W -fPIE  -I../../../mkspecs/devices/linux-buildroot-g++ -I.
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include -o psql.o psql.cpp
psql.cpp:42:22: fatal error: libpq-fe.h: No such file or directory
compilation terminated.
make[1]: *** [psql.o] Error 1
make[1]: Leaving directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/unix/psql'
PostgreSQL disabled.
SQLite2 auto-detection... ()
make[1]: Entering directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/unix/sqlite2'
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++ -c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -pipe -Os --sysroot=/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot -O2 -O3
-Wall -W -fPIE  -I../../../mkspecs/devices/linux-buildroot-g++ -I.
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include -o sqlite2.o sqlite2.cpp
sqlite2.cpp:42:20: fatal error: sqlite.h: No such file or directory
compilation terminated.
make[1]: *** [sqlite2.o] Error 1
make[1]: Leaving directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/unix/sqlite2'
SQLite2 disabled.
TDS auto-detection... ()
make[1]: Entering directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/unix/tds'
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++ -c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -pipe -Os --sysroot=/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot -O2 -O3
-Wall -W -fPIE  -I../../../mkspecs/devices/linux-buildroot-g++ -I.
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include -o tds.o tds.cpp
tds.cpp:42:22: fatal error: sybfront.h: No such file or directory
compilation terminated.
make[1]: *** [tds.o] Error 1
make[1]: Leaving directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/unix/tds'
TDS disabled.
D-Bus auto-detection... ()
make[1]: Entering directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/unix/dbus'
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++ -c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -pipe -Os --sysroot=/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot -O2 -O3
-Wall -W -fPIE  -I../../../mkspecs/devices/linux-buildroot-g++ -I.
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/dbus-1.0
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/dbus-1.0/include -o dbus.o dbus.cpp
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++ -Wl,-O1 -o dbus dbus.o   -ldl
--sysroot=/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot
-L/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -ldbus-1 -lpthread -lrt 
make[1]: Leaving directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/unix/dbus'
D-Bus enabled.
Glib auto-detection... ()
make[1]: Entering directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/unix/glib'
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++ -c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -pipe -Os --sysroot=/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot -O2 -O3
-Wall -W -fPIE  -I../../../mkspecs/devices/linux-buildroot-g++ -I.
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/glib-2.0
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/glib-2.0/include -o glib.o glib.cpp
glib.cpp: In function 'int main(int, char**)':
glib.cpp:52:9: warning: 'void g_thread_init(gpointer)' is deprecated (declared at
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/glib-2.0/glib/deprecated/gthread.h:260)
[-Wdeprecated-declarations]
glib.cpp:52:27: warning: 'void g_thread_init(gpointer)' is deprecated (declared at
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/glib-2.0/glib/deprecated/gthread.h:260)
[-Wdeprecated-declarations]
glib.cpp:48:19: warning: variable 'context' set but not used [-Wunused-but-set-variable]
glib.cpp:55:38: warning: 'pollfd' is used uninitialized in this function [-Wuninitialized]
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++ -Wl,-O1 -o glib glib.o   -lrt -lpthread -ldl
--sysroot=/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot -pthread -lgthread-2.0
-L/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -lglib-2.0 -lintl 
make[1]: Leaving directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/unix/glib'
Glib enabled.
ICU auto-detection... ()
make[1]: Entering directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/unix/icu'
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++ -c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -pipe -Os --sysroot=/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot -O2 -O3
-Wall -W -fPIE  -I../../../mkspecs/devices/linux-buildroot-g++ -I.
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include -o icu.o icu.cpp
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++ -Wl,-O1 -o icu icu.o   -lrt -lpthread -ldl
--sysroot=/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot -licuuc -licui18n 
make[1]: Leaving directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/unix/icu'
ICU enabled.
PulseAudio auto-detection... ()
make[1]: Entering directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/unix/pulseaudio'
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++ -c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -pipe -Os --sysroot=/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot -O2 -O3
-Wall -W -fPIE  -I../../../mkspecs/devices/linux-buildroot-g++ -I.
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include -o pulseaudio.o pulseaudio.cpp
pulseaudio.cpp:42:30: fatal error: pulse/pulseaudio.h: No such file or directory
compilation terminated.
make[1]: *** [pulseaudio.o] Error 1
make[1]: Leaving directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/unix/pulseaudio'
PulseAudio disabled.
evdev auto-detection... ()
make[1]: Entering directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/unix/evdev'
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++ -c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -pipe -Os --sysroot=/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot -O2 -O3
-Wall -W -fPIE  -I../../../mkspecs/devices/linux-buildroot-g++ -I.
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include -o evdev.o evdev.cpp
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++ -Wl,-O1 -o evdev evdev.o   -lrt -lpthread -ldl
--sysroot=/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot 
make[1]: Leaving directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/unix/evdev'
evdev enabled.
XLib auto-detection... ()
make[1]: Entering directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/x11/xlib'
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++ -c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -pipe -Os --sysroot=/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot -O2 -O3
-Wall -W -fPIE  -I../../../mkspecs/devices/linux-buildroot-g++ -I.
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include -o xlib.o xlib.cpp
xlib.cpp:42:22: fatal error: X11/Xlib.h: No such file or directory
compilation terminated.
make[1]: *** [xlib.o] Error 1
make[1]: Leaving directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/x11/xlib'
XLib disabled.
Xrender auto-detection... ()
make[1]: Entering directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/x11/xrender'
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++ -c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -pipe -Os --sysroot=/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot -O2 -O3
-Wall -W -fPIE  -I../../../mkspecs/devices/linux-buildroot-g++ -I.
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include -o xrender.o xrender.cpp
xrender.cpp:42:22: fatal error: X11/Xlib.h: No such file or directory
compilation terminated.
make[1]: *** [xrender.o] Error 1
make[1]: Leaving directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/x11/xrender'
Xrender disabled.
DirectFB auto-detection... ()
make[1]: Entering directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/qpa/directfb'
/home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-g++ -c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -pipe -Os --sysroot=/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot
-D_REENTRANT -O2 -O3 -Wall -W -fPIE  -I../../../mkspecs/devices/linux-buildroot-g++ -I.
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include
-I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/directfb -o directfb.o directfb.cpp
directfb.cpp:45:2: error: #error DirectFB headers are unclean and cannot compile
make[1]: *** [directfb.o] Error 1
make[1]: Leaving directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/qpa/directfb'
DirectFB disabled.
 DirectFB support cannot be enabled due to functionality tests!
 Turn on verbose messaging (-v) to ./configure to see the final report.
 If you believe this message is in error you may use the continue
 switch (-continue) to ./configure to continue.
make: *** [/home/buildroot12git/output/build/qt5base-5.0.2/.stamp_configured] Error 101


-----Oorspronkelijk bericht-----
Van: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com] 
Verzonden: woensdag 7 augustus 2013 17:12
Aan: Sagaert Johan
CC: buildroot at busybox.net
Onderwerp: Re: [Buildroot] qt 5.02 not building

Dear Sagaert Johan,

On Wed, 7 Aug 2013 16:30:40 +0200, Sagaert Johan wrote:

> make[1]: Entering directory `/home/buildroot12git/output/build/qt5base-5.0.2/config.tests/common/sse2'
> /home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnu
> eabi-g++ -c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64 -pipe -Os 
> --sysroot=/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot -msse2 -g -Wall -W -fPIE
-I../../../mkspecs/devices/linux-buildroot-g++ -I.
> -I/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnuea
> bi/sysroot/usr/include -o sse2.o sse2.cpp
> cc1plus: error: unrecognized command line option '-msse2'

Is the build *really* failing and aborting at this point? What you're showing here is part of the tests that Qt does to find out the
capabilities of the compiler. Here, it tests whether it supports the
-msse2 option, which obviously isn't possible because you're building for ARM.

So Qt will simply assume that SSE2 isn't available, and will continue with other configuration tests.

Thomas
--
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux development, consulting, training and support.
http://free-electrons.com
