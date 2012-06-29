From: Jonas Keidel <jonas@jonas-keidel.de>
Date: Fri, 29 Jun 2012 07:52:55 +0200
Subject: [Buildroot] Buildroot Udev Compiling
Message-ID: <19f6cb67d4b8fd0957ffd1ec1c9c4a2f@jonas-keidel.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey guys,

it's me again. I have problems with udev compuiling in builroot...It 
stops with the following error message. I use the current git version of 
buildroot.

Here ist my config file:
http://pastebin.com/UU3HedKC

This is the error message:

>>> udev 182 Building
PATH="/usr/src/rescue-src/initramfs/busybox/building/git/buildroot/output/host/bin:/usr/src/rescue-src/initramfs/busybox/building/git/buildroot/output/host/usr/bin:/usr/src/rescue-src/initramfs/busybox/building/git/buildroot/output/host/usr/sbin/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" 
PERLLIB="/usr/src/rescue-src/initramfs/busybox/building/git/buildroot/output/host/usr/lib/perl" 
  /usr/bin/make -j8  -C 
/usr/src/rescue-src/initramfs/busybox/building/git/buildroot/output/build/udev-182/
make[1]: Entering directory 
`/usr/src/rescue-src/initramfs/busybox/building/git/buildroot/output/build/udev-182'
/usr/bin/make --no-print-directory all-recursive
Making all in .
   CCLD   udevadm
   CCLD   udevd
/usr/src/rescue-src/initramfs/busybox/building/git/buildroot/output/host/usr/x86_64-unknown-linux-uclibc/sysroot/usr/lib/libblkid.so: 
file not recognized: Is a directory
collect2: ld returned 1 exit status
/usr/src/rescue-src/initramfs/busybox/building/git/buildroot/output/host/usr/x86_64-unknown-linux-uclibc/sysroot/usr/lib/libblkid.so: 
file not recognized: Is a directory
collect2: ld returned 1 exit status
make[3]: *** [udevd] Error 1
make[3]: *** Waiting for unfinished jobs....
make[3]: *** [udevadm] Error 1
make[2]: *** [all-recursive] Error 1
make[1]: *** [all] Error 2
make[1]: Leaving directory 
`/usr/src/rescue-src/initramfs/busybox/building/git/buildroot/output/build/udev-182'
make: *** 
[/usr/src/rescue-src/initramfs/busybox/building/git/buildroot/output/build/udev-182/.stamp_built] 
Error 2

Thx a lot!
