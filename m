From: hamish at uclibc.org <hamish@uclibc.org>
Date: Tue, 13 Jan 2009 00:46:40 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20090113004640.C043E769B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: hamish
Date: 2009-01-13 00:46:39 +0000 (Tue, 13 Jan 2009)
New Revision: 24808

Log:
Added missing libdnet package


Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2009-01-12 22:12:22 UTC (rev 24807)
+++ trunk/buildroot/package/Config.in	2009-01-13 00:46:39 UTC (rev 24808)
@@ -152,6 +152,7 @@
 source "package/libcgi/Config.in"
 source "package/libcgicc/Config.in"
 source "package/libcurl/Config.in"
+source "package/libdnet/Config.in"
 source "package/libeXosip2/Config.in"
 source "package/libosip2/Config.in"
 source "package/libpcap/Config.in"
