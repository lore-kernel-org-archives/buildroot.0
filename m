From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 30 Nov 2007 04:35:56 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/lighttpd
Message-ID: <20071130123556.1055430058@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-11-30 04:35:55 -0800 (Fri, 30 Nov 2007)
New Revision: 20599

Log:
Fix spelling error in lighttpd

Modified:
   trunk/buildroot/package/lighttpd/Config.in


Changeset:
Modified: trunk/buildroot/package/lighttpd/Config.in
===================================================================
--- trunk/buildroot/package/lighttpd/Config.in	2007-11-30 12:34:54 UTC (rev 20598)
+++ trunk/buildroot/package/lighttpd/Config.in	2007-11-30 12:35:55 UTC (rev 20599)
@@ -18,4 +18,4 @@
 	depends on BR2_PACKAGE_LIGHTTPD
 	select BR2_PACKAGE_OPENSSL
 	help
-	  Enable OpenSSL support for libghttpd.
+	  Enable OpenSSL support for lighttpd.
