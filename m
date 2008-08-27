From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 27 Aug 2008 13:19:53 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/ubifs
Message-ID: <20080827201953.C20A63C878@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-27 13:19:53 -0700 (Wed, 27 Aug 2008)
New Revision: 23269

Log:
ubifs: fix long help text lines

Modified:
   trunk/buildroot/target/ubifs/Config.in


Changeset:
Modified: trunk/buildroot/target/ubifs/Config.in
===================================================================
--- trunk/buildroot/target/ubifs/Config.in	2008-08-27 20:19:50 UTC (rev 23268)
+++ trunk/buildroot/target/ubifs/Config.in	2008-08-27 20:19:53 UTC (rev 23269)
@@ -38,7 +38,8 @@
 	default BR2_TARGET_ROOTFS_UBIFS_RT_LZO
 	depends on BR2_TARGET_ROOTFS_UBIFS
 	help
-	  Select which compression format to use at run-time within the ubifs file system.
+	  Select which compression format to use at run-time within
+	  the ubifs file system.
 
 config BR2_TARGET_ROOTFS_UBIFS_RT_NONE
 	bool "no compression"
@@ -62,7 +63,8 @@
 	default BR2_TARGET_ROOTFS_UBIFS_NONE
 	depends on BR2_TARGET_ROOTFS_UBIFS
 	help
-	  Select which compression format to compress the final image into.
+	  Select which compression format to compress the final image
+	  into.
 
 config BR2_TARGET_ROOTFS_UBIFS_NONE
 	bool "no compression"
@@ -73,22 +75,25 @@
 	bool "gzip"
 	help
 	  Do compress the ubifs filesystem with gzip.
-	  Note that you either have to have gzip installed on your host
-	  or select to build a gzip for your host. See the packages submenu.
+	  Note that you either have to have gzip installed on your
+	  host or select to build a gzip for your host. See the
+	  packages submenu.
 
 config BR2_TARGET_ROOTFS_UBIFS_BZIP2
 	bool "bzip2"
 	help
 	  Do compress the ubifs filesystem with bzip2.
-	  Note that you either have to have bzip2 installed on your host
-	  or select to build a bzip2 for your host. See the packages submenu.
+	  Note that you either have to have bzip2 installed on your
+	  host or select to build a bzip2 for your host. See the
+	  packages submenu.
 
 config BR2_TARGET_ROOTFS_UBIFS_LZMA
 	bool "lzma"
 	help
 	  Do compress the ubifs filesystem with lzma.
-	  Note that you either have to have lzma installed on your host
-	  or select to build a lzma for your host. See the packages submenu.
+	  Note that you either have to have lzma installed on your
+	  host or select to build a lzma for your host. See the
+	  packages submenu.
 
 endchoice
 
