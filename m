From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 30 May 2017 13:59:42 +0000
Subject: [Buildroot] [Bug 9916] New: qt5 does not build on
 arm-buildroot-linux-uclibcgnueabihf
Message-ID: <bug-9916-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9916

            Bug ID: 9916
           Summary: qt5 does not build on
                    arm-buildroot-linux-uclibcgnueabihf
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: uwe at hermann-uwe.de
                CC: buildroot at uclibc.org
  Target Milestone: ---

Log:

[...]/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-g++ -c -pipe
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
--sysroot=[...]/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot -O3
-O3 -std=c++1z -fvisibility=hidden -fvisibility-inlines-hidden -Wall -W -Wvla
-Wdate-time -D_REENTRANT -fPIC -
DQT_NO_USING_NAMESPACE -DQT_NO_FOREACH -DQT_HAVE_POLL -DQT_HAVE_PPOLL
-DQT_BUILD_CORE_LIB -DQT_BUILDING_QT -DQT_NO_CAST_TO_ASCII
-DQT_ASCII_CAST_WARNINGS -DQT_MOC_COMPAT -DQT_USE_QSTRINGBUILDER
-DQT_DEPRECATED_WARNINGS -DQT_DIS
ABLE_DEPRECATED_BEFORE=0x050000 -D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE
-DQT_NO_DEBUG -I. -Iglobal -I../3rdparty/harfbuzz/src -I../3rdparty/md5
-I../3rdparty/md4 -I../3rdparty/sha3 -I../3rdparty/double-conversion/include
-I..
/3rdparty/double-conversion/include/double-conversion -I../3rdparty/forkfd
-I../../include -I../../include/QtCore -I../../include/QtCore/5.8.0
-I../../include/QtCore/5.8.0/QtCore -I.moc
-I/[...]/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/glib-2.0
-I[...]/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/glib-2.0/include
-I[...]/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include
-I../../mkspecs/devices/linux-buildroot-g++ -o .obj/qhash.o tools/qhash.cpp
{standard input}: Assembler messages:
{standard input}:262: Error: selected processor does not support `crc32w
r2,r2,ip' in ARM mode
{standard input}:263: Error: selected processor does not support `crc32w
r2,r2,lr' in ARM mode
{standard input}:290: Error: selected processor does not support `crc32b
r2,r2,r3' in ARM mode
{standard input}:296: Error: selected processor does not support `crc32h
r2,r2,r3' in ARM mode
{standard input}:302: Error: selected processor does not support `crc32w
r2,r2,r3' in ARM mode
{standard input}:334: Error: selected processor does not support `crc32w
r1,r1,r2' in ARM mode
{standard input}:335: Error: selected processor does not support `crc32w
r1,r1,r0' in ARM mode
{standard input}:357: Error: selected processor does not support `crc32b
r1,r1,r3' in ARM mode
{standard input}:362: Error: selected processor does not support `crc32h
r1,r1,r2' in ARM mode
{standard input}:368: Error: selected processor does not support `crc32w
r1,r1,r2' in ARM mode
{standard input}:401: Error: selected processor does not support `crc32w
r1,r1,r2' in ARM mode
{standard input}:402: Error: selected processor does not support `crc32w
r1,r1,r0' in ARM mode
{standard input}:421: Error: selected processor does not support `crc32h
r1,r1,r3' in ARM mode
{standard input}:426: Error: selected processor does not support `crc32w
r1,r1,r2' in ARM mode
{standard input}:468: Error: selected processor does not support `crc32w
r1,r1,r2' in ARM mode
{standard input}:469: Error: selected processor does not support `crc32w
r1,r1,r0' in ARM mode
{standard input}:488: Error: selected processor does not support `crc32h
r1,r1,r3' in ARM mode
{standard input}:493: Error: selected processor does not support `crc32w
r1,r1,r2' in ARM mode
{standard input}:540: Error: selected processor does not support `crc32w
r1,r1,r2' in ARM mode
{standard input}:541: Error: selected processor does not support `crc32w
r1,r1,r0' in ARM mode
{standard input}:579: Error: selected processor does not support `crc32b
r1,r1,r3' in ARM mode
{standard input}:584: Error: selected processor does not support `crc32h
r1,r1,r3' in ARM mode
{standard input}:590: Error: selected processor does not support `crc32w
r1,r1,r3' in ARM mode
{standard input}:623: Error: selected processor does not support `crc32w
r2,r2,r1' in ARM mode
{standard input}:624: Error: selected processor does not support `crc32w
r2,r2,r0' in ARM mode
{standard input}:651: Error: selected processor does not support `crc32b
r2,r2,r3' in ARM mode
{standard input}:656: Error: selected processor does not support `crc32h
r2,r2,r3' in ARM mode
{standard input}:662: Error: selected processor does not support `crc32w
r2,r2,r3' in ARM mode
{standard input}:1556: Error: selected processor does not support `crc32w
r0,r0,r3' in ARM mode
{standard input}:1575: Error: selected processor does not support `crc32w
r0,r0,r3' in ARM mode
{standard input}:1577: Error: selected processor does not support `crc32w
r0,r0,r3' in ARM mode
{standard input}:1596: Error: selected processor does not support `crc32w
r0,r0,r3' in ARM mode
{standard input}:1598: Error: selected processor does not support `crc32w
r0,r0,r3' in ARM mode
Makefile:14306: recipe for target '.obj/qhash.o' failed
make[3]: *** [.obj/qhash.o] Error 1
make[3]: Target 'first' not remade because of errors.
make[3]: Leaving directory '[...]/output/build/qt5base-5.8.0/src/corelib'
Makefile:161: recipe for target 'sub-corelib-make_first' failed
make[2]: *** [sub-corelib-make_first] Error 2

-- 
You are receiving this mail because:
You are on the CC list for the bug.
