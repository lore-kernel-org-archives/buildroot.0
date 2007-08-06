From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon,  6 Aug 2007 12:41:44 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20070806194144.8CF5FA6074@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-06 12:41:40 -0700 (Mon, 06 Aug 2007)
New Revision: 19415

Log:
Allo configuration of libdaemon

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-08-06 15:49:12 UTC (rev 19414)
+++ trunk/buildroot/package/Config.in	2007-08-06 19:41:40 UTC (rev 19415)
@@ -63,6 +63,7 @@
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/less/Config.in"
 endif
+source "package/libdaemon/Config.in"
 source "package/libelf/Config.in"
 source "package/libevent/Config.in"
 source "package/libfloat/Config.in"
