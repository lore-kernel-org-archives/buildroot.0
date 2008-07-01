From: correa at uclibc.org <correa@uclibc.org>
Date: Tue,  1 Jul 2008 06:58:01 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/qte
Message-ID: <20080701135801.DE5273C664@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: correa
Date: 2008-07-01 06:58:01 -0700 (Tue, 01 Jul 2008)
New Revision: 22592

Log:
Mark Qt/E as deprecated (it is a really old version of Qtopia). Next step will be removal.

Modified:
   trunk/buildroot/package/qte/Config.in


Changeset:
Modified: trunk/buildroot/package/qte/Config.in
===================================================================
--- trunk/buildroot/package/qte/Config.in	2008-07-01 13:37:12 UTC (rev 22591)
+++ trunk/buildroot/package/qte/Config.in	2008-07-01 13:58:01 UTC (rev 22592)
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_QTE
 	bool "Qt/E"
 	default n
+	depends on BR2_DEPRECATED
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_PTHREADS_NATIVE
 	select BR2_PACKAGE_JPEG
