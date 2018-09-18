From: =?UTF-8?Q?Roberto_Alejandro_Esp=C3=AD_Mu=C3=B1oz?= <teratux@gmail.com>
Date: Tue, 18 Sep 2018 16:55:09 -0400
Subject: [Buildroot] problem compiling kodi 17.6 ...
Message-ID: <CAG-SZaJPgXvNRMSWBb156NWzmGg4kHa99cOzxd4zTFHkaDjgGw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello I'm currently trying to generate a system for a RPi3 using Kodi.  The
system has been building without any issues up to the point it starts with
Kodi.  I'm suspecting it's an issue with another part of the build process,
stil the error manifests with Kodi:

  CCLD     libdvdnav.la
libtool: warning:
'/home/teratux/work/adbox/dtt/build/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/
libexpat.la' seems to be moved
libtool: warning:
'/home/teratux/work/adbox/dtt/build/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/
libdrm.la' seems to be moved
libtool: warning:
'/home/teratux/work/adbox/dtt/build/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/
libexpat.la' seems to be moved
libtool: warning:
'/home/teratux/work/adbox/dtt/build/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/
libdrm.la' seems to be moved
/usr/bin/grep: /usr/lib/libgbm.la: No such file or directory
/usr/bin/sed: can't read /usr/lib/libgbm.la: No such file or directory
libtool:   error: '/usr/lib/libgbm.la' is not a valid libtool archive

Any ideas on what the problem is here? I'm using buildroot-2018-08 and the
default recipe with some extra packages:

raspberrypi3_64_defconfig


Thanks in advance
-- 
teratux
------------
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180918/caa9a5a0/attachment.html>
