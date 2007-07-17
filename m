From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Mon, 16 Jul 2007 17:24:14 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20070717002414.80B6B3008E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-07-16 17:24:13 -0700 (Mon, 16 Jul 2007)
New Revision: 19122

Log:
Should have been with 'tinyhttpd' check-in.


Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-07-17 00:23:46 UTC (rev 19121)
+++ trunk/buildroot/package/Config.in	2007-07-17 00:24:13 UTC (rev 19122)
@@ -141,7 +141,6 @@
 source "package/libcgi/Config.in"
 source "package/libcgicc/Config.in"
 source "package/libpcap/Config.in"
-source "package/lighttpd/Config.in"
 source "package/links/Config.in"
 source "package/lrzsz/Config.in"
 source "package/mrouted/Config.in"
@@ -172,12 +171,14 @@
 source "package/tcpdump/Config.in"
 source "package/tftpd/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
+source "package/lighttpd/Config.in"
 source "package/thttpd/Config.in"
+source "package/tinyhttpd/Config.in"
 endif
 source "package/tn5250/Config.in"
 source "package/ttcp/Config.in"
 #if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
-# ATTENTION! This was merged into busybox! 
+# ATTENTION! This was merged into busybox!
 #source "package/udhcp/Config.in"
 #endif
 source "package/vtun/Config.in"
