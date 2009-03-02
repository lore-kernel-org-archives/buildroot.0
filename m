From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  2 Mar 2009 07:59:37 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20090302075938.1CF347747D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-02 07:59:37 +0000 (Mon, 02 Mar 2009)
New Revision: 25476

Log:
microcom: has been in busybox for a long time now

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2009-03-01 22:35:48 UTC (rev 25475)
+++ trunk/buildroot/package/Config.in	2009-03-02 07:59:37 UTC (rev 25476)
@@ -162,7 +162,7 @@
 source "package/links/Config.in"
 source "package/lrzsz/Config.in"
 source "package/mdnsresponder/Config.in"
-if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS || !BR2_PACKAGE_BUSYBOX_SNAPSHOT
+if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/microcom/Config.in"
 endif
 source "package/mii-diag/Config.in"
