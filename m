From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  1 May 2008 10:14:47 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/x86/grub
Message-ID: <20080501171447.CCF933C678@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-05-01 10:14:46 -0700 (Thu, 01 May 2008)
New Revision: 21909

Log:
add menu.lst for grub

Added:
   trunk/buildroot/target/x86/grub/menu.lst


Changeset:
Added: trunk/buildroot/target/x86/grub/menu.lst
===================================================================
--- trunk/buildroot/target/x86/grub/menu.lst	                        (rev 0)
+++ trunk/buildroot/target/x86/grub/menu.lst	2008-05-01 17:14:46 UTC (rev 21909)
@@ -0,0 +1,7 @@
+default=0
+timeout=5
+splashimage=(hd0,0)/boot/grub/splash.xpm.gz
+hiddenmenu
+title Buildroot
+	root (hd0,0)
+	kernel /boot/bzImage rw root=/dev/hda1 vga=791 
