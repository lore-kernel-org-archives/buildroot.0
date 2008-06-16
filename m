From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 16 Jun 2008 04:34:11 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libvorbis
Message-ID: <20080616113411.BFD4C3C95D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-16 04:34:11 -0700 (Mon, 16 Jun 2008)
New Revision: 22374

Log:
libvorbis: fix av32 typo in tremor default


Modified:
   trunk/buildroot/package/libvorbis/Config.in


Changeset:
Modified: trunk/buildroot/package/libvorbis/Config.in
===================================================================
--- trunk/buildroot/package/libvorbis/Config.in	2008-06-16 11:26:56 UTC (rev 22373)
+++ trunk/buildroot/package/libvorbis/Config.in	2008-06-16 11:34:11 UTC (rev 22374)
@@ -25,7 +25,7 @@
 
 config BR2_PACKAGE_LIBVORBIS_TREMOR
 	bool "libvorbis integer implementation"
-	default y if BR2_arm || BR2_av32
+	default y if BR2_arm || BR2_avr32
 	default n
 	depends on BR2_PACKAGE_LIBVORBIS
 	help
