From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 29 Aug 2006 09:41:56 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20060829164156.1A12148632@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-08-29 09:41:55 -0700 (Tue, 29 Aug 2006)
New Revision: 16013

Log:
- add lzma


Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2006-08-29 16:41:22 UTC (rev 16012)
+++ trunk/buildroot/package/Config.in	2006-08-29 16:41:55 UTC (rev 16013)
@@ -82,6 +82,7 @@
 source "package/ltt/Config.in"
 source "package/lvm2/Config.in"
 source "package/lzo/Config.in"
+source "package/lzma/Config.in"
 source "package/m4/Config.in"
 source "package/mdadm/Config.in"
 source "package/memtester/Config.in"
