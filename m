From: hamish at uclibc.org <hamish@uclibc.org>
Date: Mon, 25 Aug 2008 18:05:52 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20080826010552.0BC093C6C1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: hamish
Date: 2008-08-25 18:05:51 -0700 (Mon, 25 Aug 2008)
New Revision: 23202

Log:
Bump 1.11.x version to 1.11.2 (no patches yet)


Modified:
   trunk/buildroot/package/busybox/Config.in


Changeset:
Modified: trunk/buildroot/package/busybox/Config.in
===================================================================
--- trunk/buildroot/package/busybox/Config.in	2008-08-26 00:41:29 UTC (rev 23201)
+++ trunk/buildroot/package/busybox/Config.in	2008-08-26 01:05:51 UTC (rev 23202)
@@ -59,7 +59,7 @@
 	default "1.8.3"		if BR2_BUSYBOX_VERSION_1_8_X
 	default "1.9.2"		if BR2_BUSYBOX_VERSION_1_9_X
 	default "1.10.4"	if BR2_BUSYBOX_VERSION_1_10_X
-	default "1.11.1"	if BR2_BUSYBOX_VERSION_1_11_X
+	default "1.11.2"	if BR2_BUSYBOX_VERSION_1_11_X
 	default "1.12.0"	if BR2_BUSYBOX_VERSION_1_12_X
 
 config BR2_PACKAGE_BUSYBOX_FULLINSTALL
