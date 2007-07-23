From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 23 Jul 2007 08:00:38 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/avahi
Message-ID: <20070723150038.2E3F2A605F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-23 08:00:37 -0700 (Mon, 23 Jul 2007)
New Revision: 19234

Log:
Make AVAHI depend on libdaemon

Modified:
   trunk/buildroot/package/avahi/Config.in


Changeset:
Modified: trunk/buildroot/package/avahi/Config.in
===================================================================
--- trunk/buildroot/package/avahi/Config.in	2007-07-23 14:43:40 UTC (rev 19233)
+++ trunk/buildroot/package/avahi/Config.in	2007-07-23 15:00:37 UTC (rev 19234)
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_AVAHI
 	bool "avahi"
+	depends on BR2_PACKAGE_LIBDAEMON
 	default n
 	help
 	  Avahi is a system which facilitates service
