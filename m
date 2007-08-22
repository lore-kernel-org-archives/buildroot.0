From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 22 Aug 2007 09:08:38 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20070822160838.D2AF8A45E7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-22 09:08:38 -0700 (Wed, 22 Aug 2007)
New Revision: 19652

Log:
- forgot to include the Config.in


Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-08-22 16:02:22 UTC (rev 19651)
+++ trunk/buildroot/package/Config.in	2007-08-22 16:08:38 UTC (rev 19652)
@@ -166,6 +166,7 @@
 source "package/openswan/Config.in"
 source "package/portmap/Config.in"
 source "package/pppd/Config.in"
+source "package/pptp-linux/Config.in"
 source "package/proftpd/Config.in"
 source "package/quagga/Config.in"
 source "package/rsync/Config.in"
