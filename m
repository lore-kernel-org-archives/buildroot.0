From: tallu <tallubko@yahoo.com>
Date: Wed, 30 Jan 2013 19:53:39 -0800 (PST)
Subject: [Buildroot] Problems compiling syslinux
Message-ID: <1359604419891-39620.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Everyone

I've enabled syslinux build, but it fails to compile (version 4.05).
I get the following error:

In file included from syslinux.c:50:0:
../libinstaller/linuxioctl.h:22:44: fatal error: linux/ext2_fs.h: No such
file or directory
compilation terminated.

Please help.
Tal



--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Problems-compiling-syslinux-tp39620.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
