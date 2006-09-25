From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 25 Sep 2006 05:35:27 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/iso9660
Message-ID: <20060925123527.DB60E4865A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2006-09-25 05:35:27 -0700 (Mon, 25 Sep 2006)
New Revision: 16217

Log:
GRUB package is called BR2_TARGET_GRUB

Modified:
   trunk/buildroot/target/iso9660/Config.in


Changeset:
Modified: trunk/buildroot/target/iso9660/Config.in
===================================================================
--- trunk/buildroot/target/iso9660/Config.in	2006-09-25 08:48:47 UTC (rev 16216)
+++ trunk/buildroot/target/iso9660/Config.in	2006-09-25 12:35:27 UTC (rev 16217)
@@ -3,7 +3,7 @@
 	default n
 	depends on BR2_i386
 	select BR2_TARGET_ROOTFS_EXT2
-	select BR2_PACKAGE_GRUB
+	select BR2_TARGET_GRUB
 	help
 	  Build a bootable iso9660 image
 
