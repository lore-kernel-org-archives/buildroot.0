From: Alejandro Blasco <blasco.demiguel@gmail.com>
Date: Tue, 19 Jan 2016 17:26:53 +0100
Subject: [Buildroot] as: unrecognized option '--64'
Message-ID: <CAKradHu116Zh8Rh-iWk9a=UL6SrtBz48-syBD=5uOJaZpWdRTw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, thank you for your work.

I'm having this problem after configuring and running make, and nobody talk
about it in forums, stackoverflow, ....

btw I'm using Fedora 23
* Attached .config file





make[2]: Leaving directory
'/home/alejandro/Desktop/linux/buildroot/output/build/host-gcc-initial-5.2.0/build/fixincludes'
make[2]: Entering directory
'/home/alejandro/Desktop/linux/buildroot/output/build/host-gcc-initial-5.2.0/build/gcc'
/home/alejandro/Desktop/linux/buildroot/output/host/usr/bin/ccache
/usr/bin/g++ -c   -O2
-I/home/alejandro/Desktop/linux/buildroot/output/host/usr/include
-DIN_GCC  -DCROSS_DIRECTORY_STRUCTURE  -fno-exceptions -fno-rtti
-fasynchronous-unwind-tables -W -Wall -Wno-narrowing -Wwrite-strings
-Wcast-qual -Wmissing-format-attribute -Woverloaded-virtual -pedantic
-Wno-long-long -Wno-variadic-macros
-Wno-overlength-strings   -DHAVE_CONFIG_H -DGENERATOR_FILE -I. -Ibuild
-I../../gcc -I../../gcc/build
-I../../gcc/../include  -I../../gcc/../libcpp/include  \
-DBASEVER="\"5.2.0\"" -DDATESTAMP="\"\"" \
-DREVISION="\"\"" \
-DDEVPHASE="\"\"" -DPKGVERSION="\"(Buildroot 2015.11.1) \"" \
-DBUGURL="\"<http://bugs.buildroot.net/>\"" -o build/version.o
../../gcc/version.c <http://bugs.buildroot.net/%3E%5C>
/bin/sh ../../gcc/../move-if-change tmp-gi.list gtyp-input.list
echo timestamp > s-gtyp-input
/home/alejandro/Desktop/linux/buildroot/output/host/usr/bin/ccache
/usr/bin/g++ -c   -O2
-I/home/alejandro/Desktop/linux/buildroot/output/host/usr/include
-DIN_GCC  -DCROSS_DIRECTORY_STRUCTURE  -fno-exceptions -fno-rtti
-fasynchronous-unwind-tables -W -Wall -Wno-narrowing -Wwrite-strings
-Wcast-qual -Wmissing-format-attribute -Woverloaded-virtual -pedantic
-Wno-long-long -Wno-variadic-macros
-Wno-overlength-strings   -DHAVE_CONFIG_H -DGENERATOR_FILE -I. -Ibuild
-I../../gcc -I../../gcc/build
-I../../gcc/../include  -I../../gcc/../libcpp/include  \
-o build/genconstants.o ../../gcc/genconstants.c
/home/alejandro/Desktop/linux/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/bin/as:
unrecognized option '--64'
Makefile:2436: recipe for target 'build/version.o' failed
make[2]: *** [build/version.o] Error 1
make[2]: *** Waiting for unfinished jobs....
/home/alejandro/Desktop/linux/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/bin/as:
unrecognized option '--64'
Makefile:2429: recipe for target 'build/genconstants.o' failed
make[2]: *** [build/genconstants.o] Error 1
make[2]: Leaving directory
'/home/alejandro/Desktop/linux/buildroot/output/build/host-gcc-initial-5.2.0/build/gcc'
Makefile:4099: recipe for target 'all-gcc' failed
make[1]: *** [all-gcc] Error 2
make[1]: Leaving directory
'/home/alejandro/Desktop/linux/buildroot/output/build/host-gcc-initial-5.2.0/build'
package/pkg-generic.mk:196: recipe for target
'/home/alejandro/Desktop/linux/buildroot/output/build/host-gcc-initial-5.2.0/.stamp_built'
failed
make: ***
[/home/alejandro/Desktop/linux/buildroot/output/build/host-gcc-initial-5.2.0/.stamp_built]
Error 2




Could you say me what am I doing wrong?
Thank you in advance
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160119/52fe66ee/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 63697 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160119/52fe66ee/attachment.obj>
