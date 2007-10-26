From: vanokuten at uclibc.org <vanokuten@uclibc.org>
Date: Fri, 26 Oct 2007 10:50:10 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20071026175010.4296EA6137@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vanokuten
Date: 2007-10-26 10:50:09 -0700 (Fri, 26 Oct 2007)
New Revision: 20321

Log:
make microcom visible until it appear in busybox release

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-10-24 22:29:30 UTC (rev 20320)
+++ trunk/buildroot/package/Config.in	2007-10-26 17:50:09 UTC (rev 20321)
@@ -155,7 +155,7 @@
 source "package/links/Config.in"
 source "package/lrzsz/Config.in"
 source "package/mdnsresponder/Config.in"
-if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
+if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS && !BR2_PACKAGE_BUSYBOX_SNAPSHOT
 source "package/microcom/Config.in"
 endif
 source "package/mrouted/Config.in"
