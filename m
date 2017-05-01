From: Lijun QIN <lijun.qin2008@gmail.com>
Date: Mon, 1 May 2017 15:55:15 -0500
Subject: [Buildroot] compiling error - testglib failed
Message-ID: <CALD51P9XnRjY-y41fib0tc8+H5r7k=N+rky1hADc53eM+PHnaQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Buildrooter.
I need to move old  buildroot project to X64 ubuntu16.04 from X86
ubuntu12.04
 Buildroot2011.05 + cross-compiler gcc 4.8 + x86 Ubuntu12.04 - success
 Buildroot2011.05 + cross-compiler gcc 4.8 + x84 Ubuntu 16.04 -Failed
 Error message is attached, Anybody could  please possibly provide any
advice ?
 I have multiple buildroot projects and need to move them to single build
machines.
 Thank you so much,
 Lijun Qin

>>> host-pkg-config 0.25 Building
PATH=/home/dfvsmdev/workspace/obi-eval/rootfs/buildroot-2011
.05-sdk5.1.2/output/host/bin:/home/dfvsmdev/workspace/obi-
eval/rootfs/buildroot-2011.05-sdk5.1.2/output/host/usr/bin:/
home/dfvsdev/.local/bin:/opt/arm-2013.11/bin:/usr/local/
bin:/usr/bin:/bin:/usr/local/games:/usr/games:/snap/bin
LD_LIBRARY_PATH="/home/dfvsmdev/workspace/obi-eval/rootfs/buildroot-2011.05-sdk5.1.2:"
PKG_CONFIG="" PKG_CONFIG_LIBDIR="/home/dfvsmdev/workspace/obi-eval/rootfs/
buildroot-2011.05-sdk5.1.2/output/host/usr/lib/pkgconfig"
PERLLIB="/home/dfvsmdev/workspace/obi-eval/rootfs/bu.1.2/output/host/usr/lib/perl"
 /usr/bin/make -j8  -C /home/dfvsmdev/workspace/obi-e
val/rootfs/buildroot-2011.05-sdk5.1.2/output/build/host-pkg-config-0.25/
make[2]: Entering directory '/home/dfvsmdev/workspace/obi-
eval/rootfs/buildroot-2011.05-sdk5.1.2/output/build/host-pkg-config-0.25'
/usr/bin/make  all-recursive
make[3]: Entering directory '/home/dfvsmdev/workspace/obi-
eval/rootfs/buildroot-2011.05-sdk5.1.2/output/build/host-pkg-config-0.25'
Making all in glib-1.2.10
make[4]: Entering directory '/home/dfvsmdev/workspace/obi-
eval/rootfs/buildroot-2011.05-sdk5.1.2/output/build/host-pkg
-config-0.25/glib-1.2.10'
/usr/bin/make  all-recursive
make[5]: Entering directory '/home/dfvsmdev/workspace/obi-
eval/rootfs/buildroot-2011.05-sdk5.1.2/output/build/host-pkg
-config-0.25/glib-1.2.10'
Making all in .
make[6]: Entering directory '/home/dfvsmdev/workspace/obi-
eval/rootfs/buildroot-2011.05-sdk5.1.2/output/build/host-pkg
-config-0.25/glib-1.2.10'
/bin/bash ./libtool --tag=CC   --mode=link /usr/bin/gcc  -O2
-I/home/dfvsmdev/workspace/obi-eval/rootfs/buildroot-2011.
05-sdk5.1.2/output/host/include -I/home/dfvsmdev/workspace/obi
-eval/1.05-sdk5.1.2/output/host/usr/include -Wall  -D_REENTRANT
 -L/home/dfvsmdev/workspace/obi-eval/rootfs/buildroot-2011.05-sdk5.1.2/output/host/lib
-L/home/dfvsmdev/workspace/obi-eval/rootfsdk5.1.2/output/host/usr/lib
-Wl,-rpath,/home/dfvsmdev/workspace/obi-eval/rootfs/buildroo
t-2011.05-sdk5.1.2/output/host/usr/lib -o testgdate testgdate.o libglib.la
/bin/bash ./libtool --tag=CC   --mode=link /usr/bin/gcc  -O2
-I/home/dfvsmdev/workspace/obi-eval/rootfs/buildroot-2011.
05-sdk5.1.2/output/host/include -I/home/dfvsmdev/workspace/obi
-eval/1.05-sdk5.1.2/output/host/usr/include -Wall  -D_REENTRANT
 -L/home/dfvsmdev/workspace/obi-eval/rootfs/buildroot-2011.05-sdk5.1.2/output/host/lib
-L/home/dfvsmdev/workspace/obi-eval/rootfsdk5.1.2/output/host/usr/lib
-Wl,-rpath,/home/dfvsmdev/workspace/obi-eval/rootfs/buildroo
t-2011.05-sdk5.1.2/output/host/usr/lib -o testglib testglib.o libglib.la
/bin/bash ./libtool --tag=CC   --mode=link /usr/bin/gcc  -O2
-I/home/dfvsmdev/workspace/obi-eval/rootfs/buildroot-2011.
05-sdk5.1.2/output/host/include -I/home/dfvsmdev/workspace/obi
-eval/1.05-sdk5.1.2/output/host/usr/include -Wall  -D_REENTRANT
 -L/home/dfvsmdev/workspace/obi-eval/rootfs/buildroot-2011.05-sdk5.1.2/output/host/lib
-L/home/dfvsmdev/workspace/obi-eval/rootfsdk5.1.2/output/host/usr/lib
-Wl,-rpath,/home/dfvsmdev/workspace/obi-eval/rootfs/buildroo
t-2011.05-sdk5.1.2/output/host/usr/lib -o testgdateparser testgdateparser.o
libglib.la
libtool: link: /usr/bin/gcc -O2 -I/home/dfvsmdev/workspace/obi
-eval/rootfs/buildroot-2011.05-sdk5.1.2/output/host/include
-I/home/dfvsmdev/workspace/obi-eval/rootfs/buildroot-2011.05-sdk5/include
-Wall -D_REENTRANT -Wl,-rpath -Wl,/home/dfvsmdev/workspace/o
bi-eval/rootfs/buildroot-2011.05-sdk5.1.2/output/host/usr/lib -o testgdate
testgdate.o  -L/home/dfvsmdev/workspace/obiot-2011.05-sdk5.1.2/output/host/lib
-L/home/dfvsmdev/workspace/obi-eval/rootfs/buildroot-2011.
05-sdk5.1.2/output/host/usr/lib ./.libs/libglib.a
libtool: link: /usr/bin/gcc -O2 -I/home/dfvsmdev/workspace/obi
-eval/rootfs/buildroot-2011.05-sdk5.1.2/output/host/include
-I/home/dfvsmdev/workspace/obi-eval/rootfs/buildroot-2011.05-sdk5/include
-Wall -D_REENTRANT -Wl,-rpath -Wl,/home/dfvsmdev/workspace/o
bi-eval/rootfs/buildroot-2011.05-sdk5.1.2/output/host/usr/lib -o
testgdateparser testgdateparser.o  -L/home/dfvsmdev/wotfs/buildr
oot-2011.05-sdk5.1.2/output/host/lib -L/home/dfvsmdev/workspace/obi
-eval/rootfs/buildroot-2011.05-sdk5.1.2/output/host/usr/lib
./.libs/libglib.a
libtool: link: /usr/bin/gcc -O2 -I/home/dfvsmdev/workspace/obi
-eval/rootfs/buildroot-2011.05-sdk5.1.2/output/host/include
-I/home/dfvsmdev/workspace/obi-eval/rootfs/buildroot-2011.05-sdk5/include
-Wall -D_REENTRANT -Wl,-rpath -Wl,/home/dfvsmdev/workspace/o
bi-eval/rootfs/buildroot-2011.05-sdk5.1.2/output/host/usr/lib -o testglib
testglib.o  -L/home/dfvsmdev/workspace/obi-e-2011.05-sdk5.1.2/output/host/lib
-L/home/dfvsmdev/workspace/obi-eval/rootfs/buildroot-2011.
05-sdk5.1.2/output/host/usr/lib ./.libs/libglib.a
Makefile:455: recipe for target 'testglib' failed
Makefile:449: recipe for target 'testgdate' failed
Makefile:452: recipe for target 'testgdateparser' failed
make[6]: Leaving directory '/home/dfvsmdev/workspace/obi-
eval/rootfs/buildroot-2011.05-sdk5.1.2/output/build/host-pkg
-config-0.25/glib-1.2.10'
Makefile:530: recipe for target 'all-recursive' failed
make[5]: Leaving directory '/home/dfvsmdev/workspace/obi-
eval/rootfs/buildroot-2011.05-sdk5.1.2/output/build/host-pkg
-config-0.25/glib-1.2.10'
Makefile:363: recipe for target 'all' failed
make[4]: Leaving directory '/home/dfvsmdev/workspace/obi-
eval/rootfs/buildroot-2011.05-sdk5.1.2/output/build/host-pkg
-config-0.25/glib-1.2.10'
Makefile:537: recipe for target 'all-recursive' failed
make[3]: Leaving directory '/home/dfvsmdev/workspace/obi-
eval/rootfs/buildroot-2011.05-sdk5.1.2/output/build/host-pkg-config-0.25'
Makefile:310: recipe for target 'all' failed
make[2]: Leaving directory '/home/dfvsmdev/workspace/obi-
eval/rootfs/buildroot-2011.05-sdk5.1.2/output/build/host-pkg-config-0.25'
package/Makefile.package.in:295 <http://makefile.package.in:295/>: recipe
for target '/home/dfvsmdev/workspace/obi-eval/rootfs/buildroot-2011.05-
sdk5.1.2/output/build/host-pkg-config-0.25/.stamp_built' failed
make[1]: Leaving directory '/home/dfvsmdev/workspace/obi-
eval/rootfs/buildroot-2011.05-sdk5.1.2'
Makefile:343: recipe for target 'rootfs.all' failed
make: *** [rootfs.all] Error 2
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170501/dcab3559/attachment-0001.html>
