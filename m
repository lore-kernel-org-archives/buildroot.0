From: Nataraj S Narayan <natarajsn@gmail.com>
Date: Tue, 27 Apr 2010 15:54:11 +0000
Subject: [Buildroot] BR Dbus package
Message-ID: <w2g630286c71004270854i6a41d16cw8db2f7d6dda4512c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

Adding dbus package gives me following:-

make[5]: Entering directory
`/home/noy/buildroot/output/build/dbus-glib-0.80/dbus'
/bin/sh ../libtool --tag=CC   --mode=link
/home/nataraj/arm-2009q1/bin/arm-linux-gcc -Os -pipe -Os
-mtune=arm9tdmi -march=armv5te -mabi=aapcs-linux -msoft-float
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
--sysroot /home/noy/buildroot/output/staging/  -Os -pipe -Os
-mtune=arm9tdmi -march=armv5te -mabi=aapcs-linux -msoft-float
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
--sysroot /home/noy/buildroot/output/staging/ -Wall -Wchar-subscripts
-Wmissing-declarations -Wmissing-prototypes -Wnested-externs
-Wpointer-arith -Wcast-align -Wfloat-equal -Wsign-compare
-export-symbols-regex "^[^_].*" -version-info 3:0:1 -no-undefined
--sysroot /home/noy/buildroot/output/staging/ -o libdbus-glib-1.la
-rpath /usr/lib dbus-glib.lo dbus-gmain.lo dbus-gmarshal.lo
dbus-gobject.lo dbus-gproxy.lo dbus-gtest.lo dbus-gvalue.lo
dbus-gthread.lo dbus-gtype-specialized.lo dbus-gutils.lo
dbus-gsignature.lo dbus-gvalue-utils.lo -ldbus-1 -lpthread -lrt
-lgobject-2.0 -lglib-2.0 -lintl
rm -fr  .libs/libdbus-glib-1.exp .libs/libdbus-glib-1.ver
generating symbol list for `libdbus-glib-1.la'
/home/nataraj/arm-2009q1/bin/arm-linux-nm  .libs/dbus-glib.o
.libs/dbus-gmain.o .libs/dbus-gmarshal.o .libs/dbus-gobject.o
.libs/dbus-gproxy.o .libs/dbus-gtest.o .libs/dbus-gvalue.o
.libs/dbus-gthread.o .libs/dbus-gtype-specialized.o
.libs/dbus-gutils.o .libs/dbus-gsignature.o .libs/dbus-gvalue-utils.o
| sed -n -e 's/^.*[    ]\([ABCDGIRSTW][ABCDGIRSTW]*\)[         ][
]*\([_A-Za-z][_A-Za-z0-9]*\)$/\1 \2 \2/p' |
/home/noy/buildroot/output/toolchain/bin/sed 's/.* //' | sort | uniq >
.libs/libdbus-glib-1.exp
/bin/grep -E -e "^[^_].*" ".libs/libdbus-glib-1.exp" >
".libs/libdbus-glib-1.expT"
mv -f ".libs/libdbus-glib-1.expT" ".libs/libdbus-glib-1.exp"
echo "{ global:" > .libs/libdbus-glib-1.ver
 cat .libs/libdbus-glib-1.exp | sed -e "s/\(.*\)/\1;/" >>
.libs/libdbus-glib-1.ver
 echo "local: *; };" >> .libs/libdbus-glib-1.ver
 /home/nataraj/arm-2009q1/bin/arm-linux-gcc -Os -pipe -Os
-mtune=arm9tdmi -march=armv5te -mabi=aapcs-linux -msoft-float
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
--sysroot /home/noy/buildroot/output/staging/ -shared
.libs/dbus-glib.o .libs/dbus-gmain.o .libs/dbus-gmarshal.o
.libs/dbus-gobject.o .libs/dbus-gproxy.o .libs/dbus-gtest.o
.libs/dbus-gvalue.o .libs/dbus-gthread.o
.libs/dbus-gtype-specialized.o .libs/dbus-gutils.o
.libs/dbus-gsignature.o .libs/dbus-gvalue-utils.o  -Wl,--rpath
-Wl,/home/noy/buildroot/output/host/usr/lib -Wl,--rpath
-Wl,/home/noy/buildroot/output/host/usr/lib
/home/noy/buildroot/output/host/usr/lib/libdbus-1.so
-L/home/noy/buildroot/output/host/lib
-L/home/noy/buildroot/output/host/usr/lib -lpthread -lrt
/home/noy/buildroot/output/host/usr/lib/libgobject-2.0.so
/home/noy/buildroot/output/host/usr/lib/libglib-2.0.so -lintl
-mtune=arm9tdmi -march=armv5te -mabi=aapcs-linux -msoft-float
-mtune=arm9tdmi -march=armv5te -mabi=aapcs-linux -msoft-float
-Wl,-soname -Wl,libdbus-glib-1.so.2 -Wl,-version-script
-Wl,.libs/libdbus-glib-1.ver -o .libs/libdbus-glib-1.so.2.1.0
/home/noy/buildroot/output/host/usr/lib/libdbus-1.so: could not read
symbols: File in wrong format
collect2: ld returned 1 exit status
make[5]: *** [libdbus-glib-1.la] Error 1
make[5]: Leaving directory
`/home/noy/buildroot/output/build/dbus-glib-0.80/dbus'
make[4]: *** [all-recursive] Error 1
make[4]: Leaving directory
`/home/noy/buildroot/output/build/dbus-glib-0.80/dbus'
make[3]: *** [all] Error 2
make[3]: Leaving directory
`/home/noy/buildroot/output/build/dbus-glib-0.80/dbus'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `/home/noy/buildroot/output/build/dbus-glib-0.80'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/home/noy/buildroot/output/build/dbus-glib-0.80'
make: *** [/home/noy/buildroot/output/build/dbus-glib-0.80/.stamp_built] Error 2


regards

Nataraj
