From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:59:57 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/x86/syslinux
Message-ID: <20080306185957.7303F12024B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:59:57 -0800 (Thu, 06 Mar 2008)
New Revision: 21255

Log:
added syslinux patch

Added:
   trunk/buildroot/target/x86/syslinux/syslinux-3.61-makefile.patch


Changeset:
Added: trunk/buildroot/target/x86/syslinux/syslinux-3.61-makefile.patch
===================================================================
--- trunk/buildroot/target/x86/syslinux/syslinux-3.61-makefile.patch	                        (rev 0)
+++ trunk/buildroot/target/x86/syslinux/syslinux-3.61-makefile.patch	2008-03-06 18:59:57 UTC (rev 21255)
@@ -0,0 +1,11 @@
+--- a/Makefile	2008-02-18 09:39:41.000000000 -0500
++++ b/Makefile	2008-02-18 09:43:21.000000000 -0500
+@@ -75,7 +75,7 @@ BTARGET  = kwdhash.gen version.gen versi
+ 	   ldlinux.bss ldlinux.sys ldlinux.bin \
+ 	   pxelinux.0 isolinux.bin isolinux-debug.bin \
+ 	   extlinux.bin extlinux.bss extlinux.sys
+-BOBJECTS = $(BTARGET) mbr/mbr.bin dos/syslinux.com win32/syslinux.exe \
++BOBJECTS = $(BTARGET) mbr/mbr.bin dos/syslinux.com  \
+ 	memdisk/memdisk memdump/memdump.com
+ # BESUBDIRS and IESUBDIRS are "early", i.e. before the root; BSUBDIRS
+ # and ISUBDIRS are "late", after the root.
