From: Guillaume Dargaud <dargaud@lpsc.in2p3.fr>
Date: Tue, 20 Sep 2011 11:14:07 +0200
Subject: [Buildroot] df returns nothing
Message-ID: <201109201114.07295.dargaud@lpsc.in2p3.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,
it's not really a problem as my buildroot system is working fine, but df returns nothing. I'm using a cpio ramdisk 
embedded in the kernel, so that's probably the reason, still I'm curious as to why I can't get an answer:

# df
Filesystem                Size      Used Available Use% Mounted on

# df /
Filesystem                Size      Used Available Use% Mounted on
df: /: can't find mount point

# mount
rootfs on / type rootfs (rw,relatime)
proc on /proc type proc (rw,relatime)
devpts on /dev/pts type devpts (rw,relatime,gid=5,mode=620)
sysfs on /sys type sysfs (rw,relatime)

-- 
Guillaume Dargaud
http://www.gdargaud.net/
