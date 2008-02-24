From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 24 Feb 2008 13:35:02 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20080224213502.20D9412C618@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-02-24 13:35:01 -0800 (Sun, 24 Feb 2008)
New Revision: 21104

Log:
move fis+fconfig packages under BR2_BLOCKDEV_SUPPORT

Move fis + fconfig packages together with mtd utils under
Hardware handling / blockdevices and filesystem maintenance.


Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-02-24 21:34:52 UTC (rev 21103)
+++ trunk/buildroot/package/Config.in	2008-02-24 21:35:01 UTC (rev 21104)
@@ -63,9 +63,7 @@
 source "package/bsdiff/Config.in"
 source "package/customize/Config.in"
 source "package/dash/Config.in"
-source "package/fconfig/Config.in"
 source "package/file/Config.in"
-source "package/fis/Config.in"
 source "package/kexec/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/less/Config.in"
@@ -233,6 +231,8 @@
 source "package/dm/Config.in"
 source "package/dmraid/Config.in"
 source "package/e2fsprogs/Config.in"
+source "package/fconfig/Config.in"
+source "package/fis/Config.in"
 source "package/fuse/Config.in"
 source "package/gadgetfs-test/Config.in"
 source "package/hal/Config.in"
