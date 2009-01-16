From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 16 Jan 2009 21:19:52 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libeXosip2
Message-ID: <20090116211952.BF6327757F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-16 21:19:50 +0000 (Fri, 16 Jan 2009)
New Revision: 24889

Log:
libeXosip2 requires libosip2

Modified:
   trunk/buildroot/package/libeXosip2/Config.in


Changeset:
Modified: trunk/buildroot/package/libeXosip2/Config.in
===================================================================
--- trunk/buildroot/package/libeXosip2/Config.in	2009-01-16 21:18:08 UTC (rev 24888)
+++ trunk/buildroot/package/libeXosip2/Config.in	2009-01-16 21:19:50 UTC (rev 24889)
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBEXOSIP2
 	bool "libeXosip2"
+	select BR2_PACKAGE_LIBOSIP2
 	help
 	  GNU Higher level SIP (Session Initiation Protocol)
 	  This library aims to provide multimedia and telecom software
