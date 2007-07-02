From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon,  2 Jul 2007 08:20:05 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20070702152005.0E8F4A65F6@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-02 08:20:05 -0700 (Mon, 02 Jul 2007)
New Revision: 18993

Log:
- forgot a line


Modified:
   trunk/buildroot/package/busybox/Config.in


Changeset:
Modified: trunk/buildroot/package/busybox/Config.in
===================================================================
--- trunk/buildroot/package/busybox/Config.in	2007-07-02 14:35:11 UTC (rev 18992)
+++ trunk/buildroot/package/busybox/Config.in	2007-07-02 15:20:05 UTC (rev 18993)
@@ -71,6 +71,7 @@
 	default "1.5.0"		if BR2_BUSYBOX_VERSION_1_5_0
 	default "1.5.1"		if BR2_BUSYBOX_VERSION_1_5_1
 	default "1.6.0"		if BR2_BUSYBOX_VERSION_1_6_0
+	default "1.6.1"		if BR2_BUSYBOX_VERSION_1_6_1
 
 
 config BR2_PACKAGE_BUSYBOX_INSTALL_SYMLINKS
