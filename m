From: Peter Katzmann <peter.katzmann@edag.de>
Date: Fri, 08 Nov 2013 09:21:05 +0100
Subject: [Buildroot] Problems to build udev on 2013.08.1
Message-ID: <527C9EF1.1020905@edag.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
i have two buildroot projects. One requires udev.
I get always the same error (at the end).
So i took my second project, enabled udev there also and the same error.
One project is with linaroo and the other one with eglibc/gcc.
I also tried the build on different Platforms (Opensuse 12.3/13.1 Ubuntu 
10.04/12.04/13.10), always the same problem.

It seems that somewhere a wrong link or duplicating of the path leads to 
the error.

Attached is the config of the eglibc project.

peter

   CCLD   collect
libtool: link: warning: library 
`/usr2/new/Source-guru/buildroot/project_build_arm/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libblkid.la' 
was moved.
libtool: link: cannot find the library 
`/usr2/new/Source-guru/buildroot/project_build_arm/usr/arm-buildroot-linux-gnueabi/sysroot/usr2/new/Source-guru/buildroot/project_build_arm/usr/arm-buildroot-linux-gnueabi/sysroot/usr2/new/Source-guru/buildroot/project_build_arm/usr/arm-buildroot-linux-gnueabi/sysroot/usr2/new/Source-guru/buildroot/project_build_arm/usr/arm-buildroot-linux-gnueabi/sysroot/usr2/new/Source-guru/buildroot/project_build_arm/build/util-linux-2.22.2/libuuid.la' 
or unhandled argument 
`/usr2/new/Source-guru/buildroot/project_build_arm/usr/arm-buildroot-linux-gnueabi/sysroot/usr2/new/Source-guru/buildroot/project_build_arm/usr/arm-buildroot-linux-gnueabi/sysroot/usr2/new/Source-guru/buildroot/project_build_arm/usr/arm-buildroot-linux-gnueabi/sysroot/usr2/new/Source-guru/buildroot/project_build_arm/usr/arm-buildroot-linux-gnueabi/sysroot/usr2/new/Source-guru/buildroot/project_build_arm/build/util-linux-2.22.2/libuuid.la'
make[4]: *** [udevd] Fehler 1
make[4]: *** Warte auf noch nicht beendete Prozesse...
libtool: link: warning: library 
`/usr2/new/Source-guru/buildroot/project_build_arm/usr/arm-buildroot-linux-gnueabi/sysroot/usr/lib/libblkid.la' 
was moved.
libtool: link: cannot find the library 
`/usr2/new/Source-guru/buildroot/project_build_arm/usr/arm-buildroot-linux-gnueabi/sysroot/usr2/new/Source-guru/buildroot/project_build_arm/usr/arm-buildroot-linux-gnueabi/sysroot/usr2/new/Source-guru/buildroot/project_build_arm/usr/arm-buildroot-linux-gnueabi/sysroot/usr2/new/Source-guru/buildroot/project_build_arm/usr/arm-buildroot-linux-gnueabi/sysroot/usr2/new/Source-guru/buildroot/project_build_arm/build/util-linux-2.22.2/libuuid.la' 
or unhandled argument 
`/usr2/new/Source-guru/buildroot/project_build_arm/usr/arm-buildroot-linux-gnueabi/sysroot/usr2/new/Source-guru/buildroot/project_build_arm/usr/arm-buildroot-linux-gnueabi/sysroot/usr2/new/Source-guru/buildroot/project_build_arm/usr/arm-buildroot-linux-gnueabi/sysroot/usr2/new/Source-guru/buildroot/project_build_arm/usr/arm-buildroot-linux-gnueabi/sysroot/usr2/new/Source-guru/buildroot/project_build_arm/build/util-linux-2.22.2/libuuid.la'

-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/x-config
Size: 38724 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131108/4b84bcc3/attachment-0002.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: config.log
Type: text/x-log
Size: 51728 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131108/4b84bcc3/attachment-0003.bin>
